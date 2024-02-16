import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

const String IS_FIRST_TIME = 'is_first_time';
const String IS_USER = 'is_user';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> requestPermissions() async {
  //   await [
  //     Permission.camera,
  //     Permission.storage,
  //     Permission.microphone,
  //   ].request();

  //   if (await Permission.camera.isGranted) {
  //     log('Camera permission granted');
  //   }

  //   if (await Permission.storage.isGranted) {
  //     log('Storage permission granted');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // requestPermissions();
    Future.delayed(const Duration(seconds: 3), () async {
      var isBoarding = getIntAsync(IS_FIRST_TIME, defaultValue: 0);
      if (isBoarding == 0) {
        await setValue(IS_FIRST_TIME, 1);
        Get.offAllNamed('/onboarding');
      } else {
        if (getBoolAsync('IS_LOGGED_IN', defaultValue: false)) {
          Get.offAllNamed('/face_scan');
        } else {
          Get.offAllNamed('/login');
        }
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
