import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:nb_utils/nb_utils.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';

import '../../domain/entities/working_location_model.dart';
import '../../services/ml_service.dart';
import '../../utils/local_db.dart';
import 'home_controller.dart';

class AttendanceController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final HomeController homeController = Get.put(HomeController());
  RxList<Face> faces = <Face>[].obs;
  Rxn<File> image = Rxn<File>();
  late FaceDetector faceDetector;
  late MLService mlService;
  RxList<WorkingLocation> workingLocations = <WorkingLocation>[].obs;
  RxBool inLocation = false.obs;
  late Position currentLocation;
  bool isMatched = false;
  double distanceInMeters = 0;

  @override
  void onInit() {
    final options = FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);
    mlService = MLService();
    init();
    super.onInit();
  }

  Future<void> init() async {
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getWorkingLocation();
  }

  Future<bool> doFaceDetection() async {
    if (image.value != null) {
      File? _image = await removeRotation(image.value!);
      final Uint8List bytes = await _image.readAsBytes();
      final img.Image capturedImage = img.decodeImage(bytes)!;

      InputImage inputImage = InputImage.fromFile(_image);
      faces.value = await faceDetector.processImage(inputImage);

      for (Face face in faces) {
        final Rect faceRect = face.boundingBox;
        num left = faceRect.left < 0 ? 0 : faceRect.left;
        num top = faceRect.top < 0 ? 0 : faceRect.top;
        num right = faceRect.right > capturedImage.width
            ? capturedImage.width - 1
            : faceRect.right;
        num bottom = faceRect.bottom > capturedImage.height
            ? capturedImage.height - 1
            : faceRect.bottom;
        num width = right - left;
        num height = bottom - top;

        final img.Image cropedFace = img.copyCrop(capturedImage,
            x: left.toInt(),
            y: top.toInt(),
            width: width.toInt(),
            height: height.toInt());

        isMatched = await mlService.compareFaces(cropedFace);
        return isMatched;
      }
    }
    return false;
  }

  Future<File> removeRotation(File inputImage) async {
    final img.Image? capturedImage =
        img.decodeImage(await File(inputImage.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(inputImage.path)
        .writeAsBytes(img.encodeJpg(orientedImage));
  }

  Future<void> getWorkingLocation() async {
    final response = await _apiProvider.getWorkingLocations();
    response.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
      },
      (data) {
        workingLocations.value = data;
      },
    );
  }

  Future<void> postAttendance() async {
    await doFaceDetection();
    if (!isMatched) {
      Get.snackbar('Error', 'Face not matched',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    for (WorkingLocation location in workingLocations) {
      distanceInMeters = Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        location.Latitude!.toDouble(),
        location.Longitude!.toDouble(),
      );

      // if (distanceInMeters < location.Radius!) {
      //   inLocation.value = true;
      //   break;
      // }
    }
    // if (!inLocation.value) {
    //   Get.snackbar('Error', 'You are not in the working location',
    //       backgroundColor: Colors.red, colorText: Colors.white);
    //   return;
    // }
    var now = DateTime.now();
    var user =
        await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
    final response = await _apiProvider.postAttendance(
      user!.C_BPartner_ID!,
      now,
      currentLocation.latitude,
      currentLocation.longitude,
      5,
      getBoolAsync('FINGER_TYPE', defaultValue: false) ? 'In' : 'Out',
    );
    // ambil waktu terlambat
    var late = DateTime(now.year, now.month, now.day, 19, 0, 0);
    var lateDuration = now.difference(late).inMinutes;
    var message = '';
    if (!getBoolAsync('FINGER_TYPE', defaultValue: false)) {
      message +=
          'Anda baru saja melakukan Presensi Masuk pada jam ${now.hour}:${now.minute} WIB\n';
      if (lateDuration > 0) {
        message +=
            '\nAnda terlambat $lateDuration menit dari waktu yang ditentukan\n';
      }
      message += '\nSelamat Bekerja dan Semangat!';
    } else {
      message =
          'Anda baru saja melakukan Presensi Pulang pada jam ${now.hour}:${now.minute} WIB';
    }

    response.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
      },
      (data) {
        setValue(
            'FINGER_TYPE', !getBoolAsync('FINGER_TYPE', defaultValue: false));
        homeController.fingerType.value =
            getBoolAsync('FINGER_TYPE', defaultValue: false);
        Get.back();
        Get.toNamed('/success', arguments: {
          'title': 'PRESENSI BERHASIL!',
          'message': message,
        });
      },
    );
  }
}
