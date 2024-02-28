import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  String? C_BPartner_ID;

  Future<void> fetchActivities(
      {String? query, String? orderBy, int? top, int? skip, int? page}) async {
    if (C_BPartner_ID == null) {
      var user =
          await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
      C_BPartner_ID = user!.C_BPartner_ID!.toString();
    }

    if (selectedStartDate != null && selectedEndDate != null && query == null) {
      query =
          'C_BPartner_ID eq ${C_BPartner_ID!} and DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedStartDate!)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedEndDate!)}';
    } else {
      query ??= 'C_BPartner_ID eq ${C_BPartner_ID!}';
    }
    final result = await _apiProvider.getActivities(query,
        orderBy: orderBy, top: top, skip: skip, page: page);
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
        final List<Activity> fetchedActivities = [];
        Future.wait(data.data['activities'].map<Future<void>>((item) async {
          final location = await getLocation(
              double.parse(item.Latitude!), double.parse(item.Longitude!));
          fetchedActivities.add(item.copyWith(location: location));
        })).then((value) {
          if (page != null && page > 1) {
            activities.addAll(fetchedActivities);
          } else {
            activities.assignAll(fetchedActivities);
          }
          hasMore.value = data.data['page-count'] > (page ?? 1);
          groupedActivities.assignAll(groupActivitiesByDate(activities));
        });
      },
    );
  }

  Future<void> nextDay() async {
    selectedDateValue.value =
        selectedDateValue.value.add(const Duration(days: 1));
    // antara tanggal hari ini dan tanggal besok
    await fetchActivities(
      query:
          'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 1)))}',
    );
  }

  Future<void> prevDay() async {
    selectedDateValue.value =
        selectedDateValue.value.subtract(const Duration(days: 1));
    // antara tanggal kemarin dan tanggal hari ini
    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 1)))}');
  }

  Future<void> nextMonth() async {
    selectedDateValue.value = Jiffy.parseFromDateTime(selectedDateValue.value)
        .add(months: 1)
        .dateTime;

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-31').format(selectedDateValue.value)}');
  }

  Future<void> prevMonth() async {
    selectedDateValue.value = Jiffy.parseFromDateTime(selectedDateValue.value)
        .subtract(months: 1)
        .dateTime;

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-31').format(selectedDateValue.value)}');
  }

  Future<void> nextWeek() async {
    selectedDateValue.value =
        selectedDateValue.value.add(const Duration(days: 7));

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 6)))}');
  }

  Future<void> prevWeek() async {
    selectedDateValue.value =
        selectedDateValue.value.subtract(const Duration(days: 7));

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 6)))}');
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

  Future<String> getLocation(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    return '${place.street}';
  }
}

class GroupedActivity {
  final DateTime date;
  final List<Activity> activities;

  GroupedActivity({required this.date, required this.activities});
}
