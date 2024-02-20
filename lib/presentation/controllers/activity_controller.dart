import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/service_locator.dart';
import '../../data/repository/activity_repository.dart';
import '../../domain/entities/activity_model.dart';

class ActivityController extends GetxController {
  final _apiProvider = serviceLocator<ActivityRepository>();
  final RxList<Activity> activities = <Activity>[].obs;
  final RxList<Activity> filteredActivities = <Activity>[].obs;
  final RxBool isLoading = true.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  RxString selectedDate = DateFormat('MMMM yyyy').format(DateTime.now()).obs;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  Rx<DateTime> selectedDateValue = DateTime.now().obs;
  RxInt selectedNav = 2.obs;

  Future<void> fetchActivities({String? query}) async {
    isLoading.value = true;
    if (selectedStartDate != null && selectedEndDate != null && query == null) {
      query =
          'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedStartDate!)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedEndDate!)}';
    }
    final result = await _apiProvider.getActivities(query);
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

  Future<void> nextDay() async {
    if (selectedDateValue.value.day ==
        DateTime(
                selectedDateValue.value.year, selectedDateValue.value.month + 1)
            .day) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month + 1,
        1,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month,
        selectedDateValue.value.day + 1,
      );
    }
    // antara tanggal hari ini dan tanggal besok
    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 1)))}');
  }

  Future<void> prevDay() async {
    // jika hari sekarang adalah tanggal 1, maka hari sebelumnya adalah tanggal terakhir dari bulan sebelumnya
    if (selectedDateValue.value.day == 1) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month - 1,
        DateTime(
                selectedDateValue.value.year, selectedDateValue.value.month - 1)
            .day,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month,
        selectedDateValue.value.day - 1,
      );
    }
    // antara tanggal kemarin dan tanggal hari ini
    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.subtract(const Duration(days: 1)))} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)}');
  }

  Future<void> nextMonth() async {
    // jika bulan sekarang adalah desember, maka bulan berikutnya adalah januari
    if (selectedDateValue.value.month == 12) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year + 1,
        1,
        selectedDateValue.value.day,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month + 1,
        selectedDateValue.value.day,
      );
    }

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-31').format(selectedDateValue.value)}');
  }

  Future<void> prevMonth() async {
    // jika bulan sekarang adalah januari, maka bulan sebelumnya adalah desember
    if (selectedDateValue.value.month == 1) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year - 1,
        12,
        selectedDateValue.value.day,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month - 1,
        selectedDateValue.value.day,
      );
    }

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-01').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-31').format(selectedDateValue.value)}');
  }

  Future<void> nextWeek() async {
    // jika hari sekarang ditambah 7 adalah lebih dari jumlah hari dalam bulan tersebut, maka hari berikutnya adalah tanggal 1 dari bulan berikutnya
    if (selectedDateValue.value.day + 7 >
        DateTime(
                selectedDateValue.value.year, selectedDateValue.value.month + 1)
            .day) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month + 1,
        1,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month,
        selectedDateValue.value.day + 7,
      );
    }

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 6)))}');
  }

  Future<void> prevWeek() async {
    // jika hari sekarang dikurangi 7 adalah kurang dari 1, maka hari sebelumnya adalah tanggal terakhir dari bulan sebelumnya
    if (selectedDateValue.value.day - 7 < 1) {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month - 1,
        DateTime(
                selectedDateValue.value.year, selectedDateValue.value.month - 1)
            .day,
      );
    } else {
      selectedDateValue.value = DateTime(
        selectedDateValue.value.year,
        selectedDateValue.value.month,
        selectedDateValue.value.day - 7,
      );
    }

    await fetchActivities(
        query:
            'DateFinger ge ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(selectedDateValue.value.add(const Duration(days: 6)))}');
  }
}
