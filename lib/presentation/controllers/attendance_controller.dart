import 'dart:io';
import 'dart:developer' as log;

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

  late FaceDetector faceDetector;
  late MLService mlService;
  late Rxn<File> image;
  RxList<WorkingLocation> workingLocations = <WorkingLocation>[].obs;
  late RxBool inLocation;
  late Position currentLocation;
  late RxBool isLoading;
  late String locationName = '';
  double distanceInMeters = 0;

  @override
  void onInit() {
    final options = FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);
    mlService = MLService();
    image = Rxn<File>();
    isLoading = false.obs;
    inLocation = false.obs;
    super.onInit();
  }

  Future<void> init() async {
    await authController.getProfile();
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

    await mlService.doFaceDetection(image.value!);

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled || permission == LocationPermission.deniedForever) {
      Get.snackbar('Error',
          'Location services/permissions are disabled/permanently denied',
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading.value = false;
      return;
    }

    if (mlService.faces.isEmpty) {
      Get.snackbar('Error', 'No face detected',
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading.value = false;
      return;
    }

    // var useMask = await mlService.doMaskDetection();
    // if (useMask) {
    //   Get.snackbar('Error', 'Please remove mask',
    //       backgroundColor: Colors.red, colorText: Colors.white);
    //   isLoading.value = false;
    //   return;
    // }

    currentLocation = await Geolocator.getCurrentPosition();

    // if (currentLocation.isMocked) {
    //   Get.snackbar('Error', 'Fake location detected',
    //       backgroundColor: Colors.red, colorText: Colors.white);
    //   isLoading.value = false;
    //   return;
    // }

    if (homeController.authController.user.value!.IsAllowFingerfromAnywhere) {
      locationName = await getAddress(currentLocation);
      inLocation.value = true;
    } else {
      await checkLocation();
    }

    if (!inLocation.value) {
      Get.snackbar('Error', 'You are not in the working location',
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading.value = false;
      return;
    }

    await mlService.loadModel();
    bool isMatched = await mlService.compareFaces(mlService.cropedFace!);

    if (!isMatched) {
      Get.snackbar('Error', 'Face not matched',
          backgroundColor: Colors.red, colorText: Colors.white);
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
      locationName,
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
  }

  Future<void> checkLocation() async {
    inLocation.value = false;

    for (WorkingLocation location in workingLocations) {
      double currentDistanceInMeters = Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        location.Latitude!.substring(0, 9).toDouble(),
        location.Longitude!.substring(0, 9).toDouble(),
      );

      log.log('Location: ${location.Name}');
      log.log('Distance: $currentDistanceInMeters');
      log.log('Radius: ${location.Radius}');

      if (currentDistanceInMeters <= (location.Radius! + 50)) {
        inLocation.value = true;
        locationName = location.Name!;
        distanceInMeters = currentDistanceInMeters;
        break;
      }
    }
  }

  Future<String> setMessage(var now, var fingerType) async {
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

  Future<String> getAddress(Position position) async {
    final response =
        await _apiProvider.getAddress(position.latitude, position.longitude);
    return response.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
        return '';
      },
      (data) {
        // return data.historic!;
        return data;
      },
    );
  }
}
