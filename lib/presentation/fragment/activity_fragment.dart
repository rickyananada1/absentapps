import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../utils/colors.dart';
import '../component/activity_component.dart';
import '../controllers/activity_controller.dart';

class ActivityFragment extends StatefulWidget {
  const ActivityFragment({super.key});

  @override
  State<ActivityFragment> createState() => _ActivityFragmentState();
}

class _ActivityFragmentState extends State<ActivityFragment>
    with AutomaticKeepAliveClientMixin<ActivityFragment> {
  @override
  bool get wantKeepAlive => true;
  final ActivityController activityController = Get.put(ActivityController());
  final List<String> navs = ['Harian', 'Mingguan', 'Bulanan'];
  @override
  void initState() {
    super.initState();
    activityController.fetchActivities();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    if (args.value is PickerDateRange) {
      final startDate = args.value.startDate;
      final endDate = args.value.endDate ?? args.value.startDate;
      activityController.selectedStartDate = startDate;
      activityController.selectedEndDate = endDate;
      await activityController.fetchActivities(
          query:
              'DateFinger ge ${DateFormat('yyyy-MM-dd').format(startDate)} and DateFinger le ${DateFormat('yyyy-MM-dd').format(endDate)}');
    } else if (args.value is DateTime) {
      activityController.selectedDateValue.value = args.value;
      await activityController.fetchActivities(
          query:
              'DateFinger eq ${DateFormat('yyyy-MM-dd').format(args.value)}');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Aktivitas'),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await activityController.fetchActivities();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    for (var nav in navs)
                      InkWell(
                        onTap: () {
                          setState(() {
                            activityController.selectedNav.value =
                                navs.indexOf(nav);
                            if (navs.indexOf(nav) == 0) {
                              activityController.fetchActivities(
                                  query:
                                      'DateFinger eq ${DateFormat('yyyy-MM-dd').format(activityController.selectedDateValue.value)}');
                            } else if (navs.indexOf(nav) == 1) {
                              // get 1 week before selected date
                              activityController.fetchActivities(
                                  query:
                                      'DateFinger ge ${DateFormat('yyyy-MM-dd').format(activityController.selectedDateValue.value.subtract(const Duration(days: 7)))} and DateFinger le ${DateFormat('yyyy-MM-dd').format(activityController.selectedDateValue.value)}');
                            } else if (navs.indexOf(nav) == 2) {
                              // get 1 month before selected date
                              activityController.fetchActivities(
                                  query:
                                      'DateFinger ge ${DateFormat('yyyy-MM-dd').format(DateTime(activityController.selectedDateValue.value.year, activityController.selectedDateValue.value.month - 1, 1))} and DateFinger le ${DateFormat('yyyy-MM-dd').format(activityController.selectedDateValue.value)}');
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 2.5, right: 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: activityController.selectedNav.value ==
                                      navs.indexOf(nav)
                                  ? appColorPrimary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              nav,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: activityController.selectedNav.value ==
                                        navs.indexOf(nav)
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      margin: const EdgeInsets.only(left: 2.5, right: 2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: grey.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: white,
                                  border: Border.all(
                                    color: grey.withOpacity(0.5),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: SfDateRangePicker(
                                  view: DateRangePickerView.month,
                                  initialDisplayDate: activityController
                                      .selectedDateValue.value,
                                  initialSelectedRange: activityController
                                                  .selectedNav.value !=
                                              0 &&
                                          activityController
                                                  .selectedStartDate !=
                                              null &&
                                          activityController.selectedEndDate !=
                                              null
                                      ? PickerDateRange(
                                          activityController.selectedStartDate!,
                                          activityController.selectedEndDate!)
                                      : null,
                                  monthViewSettings: activityController
                                              .selectedNav.value ==
                                          1
                                      ? const DateRangePickerMonthViewSettings(
                                          showWeekNumber: true,
                                        )
                                      : const DateRangePickerMonthViewSettings(),
                                  selectionMode:
                                      activityController.selectedNav.value == 0
                                          ? DateRangePickerSelectionMode.single
                                          : DateRangePickerSelectionMode.range,
                                  showActionButtons: true,
                                  onSelectionChanged: (args) {
                                    _onSelectionChanged(args);
                                  },
                                  onSubmit: (_) => Navigator.pop(context),
                                  onCancel: () => Navigator.pop(context),
                                ),
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Text(
                            'Pilih Tanggal',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: white,
                    border: Border.all(
                      color: grey.withOpacity(0.5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (activityController.selectedNav.value == 0) {
                              await activityController.prevDay();
                            } else if (activityController.selectedNav.value ==
                                1) {
                              await activityController.prevWeek();
                            } else if (activityController.selectedNav.value ==
                                2) {
                              await activityController.prevMonth();
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                            ),
                            5.width,
                            Obx(
                              () => Text(
                                activityController.selectedNav.value == 0
                                    ? DateFormat('dd MMMM yyyy').format(
                                        activityController
                                            .selectedDateValue.value)
                                    : DateFormat('MMMM yyyy').format(
                                        activityController
                                            .selectedDateValue.value),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () async {
                            if (activityController.selectedNav.value == 0) {
                              await activityController.nextDay();
                            } else if (activityController.selectedNav.value ==
                                1) {
                              await activityController.nextWeek();
                            } else if (activityController.selectedNav.value ==
                                2) {
                              await activityController.nextMonth();
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => activityController.isLoading.value
                      ? Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: appColorPrimary,
                            size: 30,
                          ),
                        )
                      : activityController.activities.isEmpty
                          ? const Center(
                              child: Text(
                                'Tidak ada data',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: activityController.activities.length,
                              itemBuilder: (context, index) {
                                var date = activityController
                                    .activities[index].DateFinger!;
                                var type = activityController
                                    .activities[index].FingerType!.identifier!;
                                return ActivityComponent(
                                  date: date,
                                  type: type,
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
