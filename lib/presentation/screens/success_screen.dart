import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late var args;
  @override
  void initState() {
    super.initState();
    args = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 200,
              ),
              20.height,
              Text(
                args['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.height,
              Text(
                args['message'],
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              20.height,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Yeah Mengerti!',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
