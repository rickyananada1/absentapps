import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class FaceRegisterScreen extends StatelessWidget {
  const FaceRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/astina.png', height: 150, width: 200),
              const Text(
                'Face Recognition Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              30.height,
              Image.asset('assets/images/image5.png', height: 300),
              20.height,
              Image.asset('assets/images/image6.png', height: 200).onTap(() {
                Navigator.pushReplacementNamed(context, '/face_scan');
              }),
            ],
          ),
        ),
      ),
    );
  }
}
