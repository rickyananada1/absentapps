import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(AuthController());
  Future<void> requestPermissions() async {
    await Permission.location.request();
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
    Future.delayed(const Duration(seconds: 3), () async {
      if (getBoolAsync('IS_FIRST_TIME', defaultValue: true)) {
        setValue('IS_FIRST_TIME', false);
        Get.offAllNamed('/onboarding');
      } else {
        if (await authController.checkLogin()) {
          if (authController.user.value!.Biometric == null) {
            Get.offAllNamed('/face_register');
          } else {
            Get.offAllNamed('/dashboard');
          }
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
