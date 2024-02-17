import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';
import '../../domain/entities/activity_model.dart';

class ActivityController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final RxList<Activity> activities = <Activity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    final result = await _apiProvider.getActivities();
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
