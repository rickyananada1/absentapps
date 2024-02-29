import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';
import '../controllers/attendance_controller.dart';

late List<CameraDescription>? cameras;

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  late CameraController _cameraController;
  bool isControllerInitialized = false;
  bool flash = false;

  Future initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras![1], ResolutionPreset.high);
    await _cameraController.initialize();
    isControllerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);
    setState(() {});
  }

  Future<void> takePicture() async {
    XFile file = await _cameraController.takePicture();
    if (file.path.isNotEmpty) {
      attendanceController.image.value = File(file.path);
      await attendanceController.postAttendance();
    }
  }

  @override
  void initState() {
    super.initState();
    attendanceController.init();
    initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width *
                          _cameraController.value.aspectRatio,
                      child: isControllerInitialized
                          ? CameraPreview(_cameraController)
                          : null),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Lottie.asset("assets/loading.json",
                          width: MediaQuery.of(context).size.width * 0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () async {
                            await takePicture();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: attendanceController.isLoading.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: appColorPrimary,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
