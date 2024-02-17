import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';

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
  late String currentNav = navs[0];

  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

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
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  for (var nav in navs)
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentNav = nav;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 2.5, right: 2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: currentNav == nav
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
                              color: currentNav == nav
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Card(
                    margin: const EdgeInsets.only(left: 2.5, right: 2.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.green, width: 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
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
                        onPressed: () {
                          setState(() {
                            if (currentMonth == 1) {
                              currentMonth = 12;
                              currentYear--;
                            } else {
                              currentMonth--;
                            }
                          });
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
                          const SizedBox(width: 5),
                          Text(
                            DateFormat('MMMM')
                                .format(DateTime(currentYear, currentMonth)),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            currentYear.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (currentMonth == 12) {
                              currentMonth = 1;
                              currentYear++;
                            } else {
                              currentMonth++;
                            }
                          });
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
                () => activityController.activities.isEmpty
                    ? Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: appColorPrimary,
                          size: 30,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
