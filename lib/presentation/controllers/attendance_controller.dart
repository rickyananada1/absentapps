import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'package:nb_utils/nb_utils.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';

import '../../domain/entities/user.dart';
import '../../domain/entities/working_location_model.dart';
import '../../services/ml_service.dart';
import '../../utils/local_db.dart';
import 'activity_controller.dart';
import 'auth_controller.dart';
import 'home_controller.dart';

class AttendanceController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.find();
  final ActivityController activityController = Get.put(ActivityController());
  Rxn<File> image = Rxn<File>();
  late FaceDetector faceDetector;
  late MLService mlService;
  RxList<WorkingLocation> workingLocations = <WorkingLocation>[].obs;
  RxBool inLocation = false.obs;
  late Position currentLocation;
  bool isMatched = false;
  double distanceInMeters = 0;
  RxBool isLoading = false.obs;

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
    await authController.getProfile();
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getWorkingLocation();
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
    isLoading.value = true;

    if (image.value == null) {
      isLoading.value = false;
      return;
    }

    Future.wait([
      mlService.doFaceDetection(image.value!),
      checkLocation(),
    ]).then((value) async {
      if (mlService.faces.isEmpty) {
        isLoading.value = false;
        Get.snackbar('Error', 'No face detected',
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      isMatched = await mlService.compareFaces(mlService.cropedFace!);

      if (!isMatched) {
        isLoading.value = false;
        Get.snackbar('Error', 'Face not matched',
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      if (!inLocation.value) {
        isLoading.value = false;
        return;
      }

      var now = DateTime.now();
      var user =
          await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
      final response = await _apiProvider.postAttendance(
        user!.C_BPartner_ID!,
        now,
        currentLocation.latitude,
        currentLocation.longitude,
        5,
        homeController.fingerType.value,
      );

      response.fold(
        (failure) {
          Get.snackbar('Error', failure.message);
        },
        (data) async {
          var message = await setMessage(now, homeController.fingerType.value);
          await LocalDb().saveUser(
            User(
              NIP: user.NIP,
              EmployeeName: user.EmployeeName,
              C_BPartner_ID: user.C_BPartner_ID,
              embeddings: user.embeddings,
            ),
            getStringAsync('USER_ID', defaultValue: ''),
          );
          await homeController.loadData();
          await activityController.fetchActivities();
          Get.offAndToNamed('/success', arguments: {
            'title': 'PRESENSI BERHASIL!',
            'message': message,
          });
        },
      );
      isLoading.value = false;
    });
  }

  Future<void> checkLocation() async {
    if (authController.user.value!.IsAllowFingerfromAnywhere!) {
      inLocation.value = true;
      return;
    }

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied',
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

      if (distanceInMeters < location.Radius!) {
        inLocation.value = true;
        break;
      }
    }
    if (!inLocation.value) {
      Get.snackbar('Error', 'You are not in the working location',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
  }

  Future<String> setMessage(var now, var fingerType) async {
    // ambil waktu terlambat
    var late = DateTime(now.year, now.month, now.day, 19, 0, 0);
    var lateDuration = now.difference(late).inMinutes;
    var message = '';
    if (fingerType == 'In') {
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
    return message;
  }
}
