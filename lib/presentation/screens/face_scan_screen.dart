import 'dart:io';
import 'dart:math' as math;

import 'package:absentapps/utils/colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:lottie/lottie.dart';
import 'package:image/image.dart' as img;
import 'package:nb_utils/nb_utils.dart';

import '../../domain/entities/user_model.dart';
import '../../services/ml_service.dart';
import '../../utils/local_db.dart';

List<CameraDescription>? cameras;

class FaceScanScreen extends StatefulWidget {
  const FaceScanScreen({super.key});

  @override
  State<FaceScanScreen> createState() => _FaceScanScreenState();
}

class _FaceScanScreenState extends State<FaceScanScreen> {
  late CameraController _cameraController;
  bool isControllerInitialized = false;
  bool flash = false;
  late FaceDetector faceDetector;
  File? _image;
  late MLService mlService;

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
      _image = File(file.path);
      await doFaceDetection();
    }
  }

  var image;
  List<Face> faces = [];

  Future<void> doFaceDetection() async {
    if (_image != null) {
      _image = await removeRotation(_image!);

      image = await _image?.readAsBytes();
      image = await decodeImageFromList(image);

      InputImage inputImage = InputImage.fromFile(_image!);
      faces = await faceDetector.processImage(inputImage);
      for (Face face in faces) {
        Rect faceRect = face.boundingBox;
        num left = faceRect.left < 0 ? 0 : faceRect.left;
        num top = faceRect.top < 0 ? 0 : faceRect.top;
        num right =
            faceRect.right > image.width ? image.width - 1 : faceRect.right;
        num bottom =
            faceRect.bottom > image.height ? image.height - 1 : faceRect.bottom;
        num width = right - left;
        num height = bottom - top;

        final bytes = _image!.readAsBytesSync();
        final img.Image capturedImage = img.decodeImage(bytes)!;
        final img.Image cropedFace = img.copyCrop(capturedImage,
            x: left.toInt(),
            y: top.toInt(),
            width: width.toInt(),
            height: height.toInt());
        User? user = await LocalDb().getUser();
        if (user!.embeddings == null) {
          List<double> embeddings = mlService.getEmbeddings(cropedFace);
          if (embeddings.isNotEmpty) {
            mlService.registerFaceInDB(embeddings);
          }
          showFaceRegistrationDialogue(
              Uint8List.fromList(img.encodeBmp(cropedFace)));
        } else {
          bool isMatched = await mlService.compareFaces(cropedFace);
          if (isMatched) {
            toast("Face Matched");
          } else {
            toast("Face Not Matched");
          }
        }
      }
    }
  }

  removeRotation(File inputImage) async {
    final img.Image? capturedImage =
        img.decodeImage(await File(inputImage.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(_image!.path).writeAsBytes(img.encodeJpg(orientedImage));
  }

  showFaceRegistrationDialogue(Uint8List cropedFace) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Face Registration", textAlign: TextAlign.center),
        alignment: Alignment.center,
        content: SizedBox(
          height: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.memory(
                  cropedFace,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Face Registered"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColorPrimary,
                    minimumSize: const Size(200, 40)),
                child: const Text("Register", style: TextStyle(color: white)),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  @override
  void initState() {
    initializeCamera();
    final options = FaceDetectorOptions(
      // enableContours: true,
      // enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);
    mlService = MLService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                              ? _cameraController.setFlashMode(FlashMode.torch)
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
        ],
      ),
    );
  }
}
