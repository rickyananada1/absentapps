import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:nb_utils/nb_utils.dart';

import '../../domain/entities/user.dart';
import '../../services/ml_service.dart';
import '../../utils/local_db.dart';
import 'auth_controller.dart';

class FaceScanController extends GetxController {
  final AuthController authController = Get.put(AuthController());

  RxList<Face> faces = <Face>[].obs;
  Rxn<File> image = Rxn<File>();
  late FaceDetector faceDetector;
  late MLService mlService;
  RxBool isLoading = false.obs;
  bool isMatched = false;

  @override
  void onInit() {
    final options = FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);
    mlService = MLService();
    super.onInit();
  }

  Future<void> doFaceDetection() async {
    isLoading.value = true;

    Future.wait([
      mlService.doFaceDetection(image.value!) // detect face
    ]).then((value) async {
      if (mlService.faces.isEmpty) {
        isLoading.value = false;
        Get.snackbar('Error', 'No face detected',
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      var useMask = await mlService.doMaskDetection();
      if (useMask) {
        isLoading.value = false;
        Get.snackbar('Error', 'Please remove mask',
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      await mlService.loadModel();

      showFaceRegistrationDialogue(mlService.cropedFace!);
      isLoading.value = false;
    });
  }

  void showFaceRegistrationDialogue(img.Image cropedFace) async {
    User? user =
        await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
    Get.dialog(
      AlertDialog(
        title: const Text("Face Registration", textAlign: TextAlign.center),
        content: SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.memory(
                  Uint8List.fromList(img.encodeJpg(cropedFace)),
                  width: 200,
                  height: 200,
                ),
              ),
              10.height,
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  user!.NIP!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              10.height,
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  minimumSize: const Size(200, 40),
                ),
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () async {
                  List<double> embeddings = mlService.getEmbeddings(cropedFace);
                  if (embeddings.isNotEmpty) {
                    mlService.registerFaceInDB(embeddings);
                  }
                  // convert image to binary and save in db
                  String bytes = base64Encode(img.encodeJpg(cropedFace));
                  isLoading.value = true;
                  Get.back();
                  await authController.postImages(bytes, user);
                  isLoading.value = false;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 40),
                ),
                child: const Text("Register",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  @override
  void onClose() {
    faceDetector.close();
    super.onClose();
  }
}
