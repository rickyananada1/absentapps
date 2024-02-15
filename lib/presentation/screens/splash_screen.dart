import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/local_db.dart';
import 'face_scan_screen.dart';

const String IS_FIRST_TIME = 'is_first_time';
const String IS_USER = 'is_user';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      var isBoarding = getIntAsync(IS_FIRST_TIME, defaultValue: 0);
      if (isBoarding == 0) {
        await setValue(IS_FIRST_TIME, 1);
        Get.offAllNamed('/onboarding');
      } else {
        checkUser();
      }
    });
  }

  void checkUser() {
    // check db
    LocalDb().getUser().then((user) {
      if (user != null) {
        toast('Welcome back, ${user.username}');
        Get.offAll(const FaceScanScreen());
      } else {
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/astina.png'),
                height: 250,
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
