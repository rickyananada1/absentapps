import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../app/view/app.dart';
import '../../utils/colors.dart';
import '../controllers/home_controller.dart';
import '../screens/attendance_screen.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin<HomeFragment> {
  @override
  bool get wantKeepAlive => true;
  final HomeController controller = Get.put(HomeController());
  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn.value ? black : appColorPrimary,
        statusBarIconBrightness:
            appStore.isDarkModeOn.value ? Brightness.light : Brightness.dark);
  }

  @override
  void initState() {
    super.initState();
    init();
    controller.loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () {
        if (controller.dataFetched.isFalse) {
          return Container(
            color: Colors.white,
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: appColorPrimary,
                size: 30,
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: white,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendanceScreen(),
                      ),
                    );
                  },
                  icon: controller.fingerType.value == 'Out'
                      ? const Icon(Icons.login)
                      : const Icon(Icons.exit_to_app),
                  label: controller.fingerType.value == 'Out'
                      ? const Text('Clock Out')
                      : const Text('Clock In'),
                  backgroundColor: appColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.loadData();
                  setState(() {});
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.3 -
                                        60,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 216, 229, 233),
                                      Color.fromARGB(255, 255, 255, 255)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            padding: const EdgeInsets.only(
                                top: 30, left: 10, right: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    10.width,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'PT. Abadi Ogan Cemerlang',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                                maxLines: null,
                                              ),
                                              const SizedBox(width: 5),
                                              Icon(
                                                  FontAwesomeIcons
                                                      .arrowUpRightFromSquare,
                                                  color: Colors.grey[700],
                                                  size: 16),
                                            ],
                                          ),
                                          const Text(
                                            'Jika kamu merasa gagal gagal di hari ini, coba lagi besok!',
                                            style: TextStyle(fontSize: 14),
                                            maxLines: null,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                30.height,
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        const Column(
                                          children: [
                                            Text(
                                              'Jadwal Anda Hari Ini',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: appColorPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.exit_to_app,
                                              size: 30,
                                            ),
                                            const SizedBox(width: 15),
                                            const Text(
                                              '08.00',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 15),
                                            Icon(FontAwesomeIcons.ellipsis,
                                                color: Colors.grey[300]),
                                            const SizedBox(width: 15),
                                            const Icon(
                                              Icons.exit_to_app,
                                              size: 30,
                                            ),
                                            const SizedBox(width: 15),
                                            const Text(
                                              '17.00',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.circleUser,
                                  size: 40,
                                ),
                                10.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.authController.user.value!
                                                .EmployeeName ??
                                            '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        maxLines: null,
                                      ),
                                      Text(
                                        controller.authController.user.value!
                                                .Position ??
                                            '',
                                        style: const TextStyle(fontSize: 12),
                                        maxLines: null,
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.history,
                                    color: appColorPrimary.withOpacity(0.8),
                                    size: 20,
                                  ),
                                  label: const Text('Aktivitas'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        margin: const EdgeInsets.only(top: 10),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: appColorPrimary),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.calendarCheck,
                                color: appColorPrimary,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Presensi Keluar',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: appColorPrimary),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.circle,
                                size: 6,
                                color: appColorPrimary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat('EEE, d MMM yyyy HH:mm')
                                    .format(DateTime.parse('2023-05-10 17:00')),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: appColorPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: white,
                        ),
                        child: Column(
                          children: [
                            GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              children: List.generate(6, (index) {
                                IconData iconData;
                                String iconName;
                                Color iconColor;
                                switch (index % 6) {
                                  case 0:
                                    iconData = Icons.coffee_outlined;
                                    iconName = 'Istirahat';
                                    iconColor = Colors.grey;
                                    break;
                                  case 1:
                                    iconData = Icons.add_alarm_outlined;
                                    iconName = 'Lembur';
                                    iconColor = appColorPrimary;
                                    break;
                                  case 2:
                                    iconData = Icons.chair_outlined;
                                    iconName = 'Cuti';
                                    iconColor = appColorPrimary;
                                    break;
                                  case 3:
                                    iconData = Icons.door_back_door_outlined;
                                    iconName = 'Izin';
                                    iconColor = appColorPrimary;
                                    break;
                                  case 4:
                                    iconData = FontAwesomeIcons.briefcase;
                                    iconName = 'Kunjungi Klien';
                                    iconColor = appColorPrimary;
                                    break;
                                  case 5:
                                    iconData = FontAwesomeIcons.fileLines;
                                    iconName = 'Catatan';
                                    iconColor = appColorPrimary;
                                    break;
                                  default:
                                    iconData = Icons.error;
                                    iconName = 'Error';
                                    iconColor = Colors.grey;
                                    break;
                                }
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: appSecondaryBackgroundColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          iconData,
                                          size: 30,
                                          color: iconColor,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          iconName,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
