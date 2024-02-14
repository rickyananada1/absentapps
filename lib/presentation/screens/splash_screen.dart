import 'package:absentapps/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/local_db.dart';
import 'face_scan_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // check db
      // LocalDb().getUser().then((user) {
      //   if (user != null) {
      //     toast('Welcome back, ${user.username}');
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const FaceScanScreen(),
      //       ),
      //     );
      //   } else {
      //     Navigator.pushReplacementNamed(context, '/login');
      //   }
      // });

      Navigator.pushReplacementNamed(context, '/login');
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
