import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';
import '../../domain/entities/activity_model.dart';
import '../../utils/local_db.dart';

class ActivityController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final RxList<Activity> activities = <Activity>[].obs;
  final RxList<GroupedActivity> groupedActivities = <GroupedActivity>[].obs;
  final RxBool isLoading = true.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  RxString selectedDate = DateFormat('MMMM yyyy').format(DateTime.now()).obs;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  Rx<DateTime> selectedDateValue = DateTime.now().obs;
  RxInt selectedNav = 2.obs;
  RxBool hasMore = true.obs;
  String? query;
  String? C_BPartner_ID;
  RxStatus status = RxStatus.loading();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    var user =
        await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
    C_BPartner_ID = user!.C_BPartner_ID!.toString();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-01').format(Jiffy.parseFromDateTime(selectedDateValue.value).add(months: 1).dateTime)}';
    activities.clear();
    groupedActivities.clear();
    await fetchActivities(
      top: 10,
      skip: 0,
    );
    isLoading.value = false;
  }

  Future<void> fetchActivities(
      {String? orderBy, int? top, int? skip, int? page}) async {
    final result = await _apiProvider.getActivities(
        query: query,
        C_BPartner_ID: C_BPartner_ID!,
        orderBy: orderBy,
        top: top,
        skip: skip,
        page: page);

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
        if (page != null && page > 1) {
          activities.addAll(data.data['activities']);
        } else {
          activities.assignAll(data.data['activities']);
        }
        hasMore.value = data.data['page-count'] > (page ?? 1);
        groupedActivities.assignAll(groupActivitiesByDate(activities));
      },
    );
  }

  Future<void> nextDay() async {
    selectedDateValue.value =
        selectedDateValue.value.add(const Duration(days: 1));
    // antara tanggal hari ini dan tanggal besok
    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 1)))}';
    await fetchActivities(
      top: 10,
      skip: 0,
    );
  }

  Future<void> prevDay() async {
    selectedDateValue.value =
        selectedDateValue.value.subtract(const Duration(days: 1));
    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 1)))}';
    // antara tanggal kemarin dan tanggal hari ini
    await fetchActivities(
      top: 10,
      skip: 0,
    );
  }

  Future<void> nextMonth() async {
    selectedDateValue.value = Jiffy.parseFromDateTime(selectedDateValue.value)
        .add(months: 1)
        .dateTime;

    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-01').format(Jiffy.parseFromDateTime(selectedDateValue.value).add(months: 1).dateTime)}';
    await fetchActivities(
      top: 10,
      skip: 0,
    );
  }

  Future<void> prevMonth() async {
    selectedDateValue.value = Jiffy.parseFromDateTime(selectedDateValue.value)
        .subtract(months: 1)
        .dateTime;

    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-01').format(Jiffy.parseFromDateTime(selectedDateValue.value).add(months: 1).dateTime)}';
    await fetchActivities(
      top: 10,
      skip: 0,
    );
  }

  Future<void> nextWeek() async {
    selectedDateValue.value =
        selectedDateValue.value.add(const Duration(days: 6));

    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 8)))}';
    await fetchActivities(top: 10, skip: 0);
  }

  Future<void> prevWeek() async {
    selectedDateValue.value =
        selectedDateValue.value.subtract(const Duration(days: 6));

    activities.clear();
    groupedActivities.clear();
    query =
        'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 8)))}';
    await fetchActivities(top: 10, skip: 0);
  }

  List<GroupedActivity> groupActivitiesByDate(List<Activity> activities) {
    final groupedMap = groupBy(
        activities,
        (activity) => DateTime(activity.DateFinger!.year,
            activity.DateFinger!.month, activity.DateFinger!.day));

    final groupedActivities = groupedMap.entries.map((entry) {
      return GroupedActivity(date: entry.key, activities: entry.value.toList());
    }).toList();

    return groupedActivities;
  }
}

class GroupedActivity {
  final DateTime date;
  final List<Activity> activities;

  GroupedActivity({required this.date, required this.activities});
}
