import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';
import 'auth_controller.dart';
import '../../domain/entities/activity_model.dart';

class HomeController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final AuthController authController = Get.find();

  RxBool dataFetched = false.obs;
  int limit = 100;
  RxBool isLoading = false.obs;
  RxString fingerType = 'In'.obs;
  Activity? lastActivity;
  List<Activity> lastActivities = [];
  RxString clockIn = '-'.obs;
  RxString clockOut = '-'.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    await authController.getProfile();
    await getActivities();
    isLoading.value = false;
    dataFetched.value = true;
  }

  Future<void> getActivities() async {
    lastActivities.clear();
    final result = await _apiProvider.getActivities(
        'C_BPartner_ID eq ${authController.user.value!.C_BPartner_ID!.id}',
        orderBy: 'DateFinger desc',
        top: 10);
    result.fold(
      (failure) {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      },
      (data) {
        lastActivities.addAll(data.data['activities']);
        lastActivity = lastActivities.isNotEmpty ? lastActivities.first : null;
        updateClockTime();
        log('lastActivity: $lastActivity');
      },
    );
  }

  void updateClockTime() {
    if (lastActivity != null) {
      final todayActivitiesIn = lastActivities
          .where((activity) =>
              activity.DateFinger!.isToday &&
              activity.FingerType!.identifier == 'In')
          .toList();
      final todayActivitiesOut = lastActivities
          .where((activity) =>
              activity.DateFinger!.isToday &&
              activity.FingerType!.identifier == 'Out')
          .toList();

      if (todayActivitiesIn.isNotEmpty) {
        clockIn.value =
            DateFormat('HH:mm').format(todayActivitiesIn.first.DateFinger!);
      }

      if (todayActivitiesOut.isNotEmpty) {
        clockOut.value =
            DateFormat('HH:mm').format(todayActivitiesOut.first.DateFinger!);
      }

      fingerType.value =
          lastActivity!.FingerType!.identifier! == 'In' ? 'Out' : 'In';
    }
  }
}
