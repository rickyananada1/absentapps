import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';
import '../../domain/entities/activity_model.dart';

class ActivityController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final RxList<Activity> activities = <Activity>[].obs;
  final RxBool isLoading = true.obs;

  RxInt selectedNav = 0.obs;

  RxInt currentMonth = DateTime.now().month.obs;
  RxInt currentYear = DateTime.now().year.obs;

  Future<void> fetchActivities() async {
    isLoading.value = true;
    final result = await _apiProvider.getActivities();
    isLoading.value = false;
    result.fold(
      (failure) async {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      },
      (data) {
        activities.value = data;
      },
    );
  }
}
