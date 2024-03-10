import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

import '../domain/entities/user.dart';
import '../utils/local_db.dart';

class MLService {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;
  late FaceDetector faceDetector;
  List<Face> faces = [];
  File? image;
  User? user;
  img.Image? capturedImage;
  img.Image? cropedFace;
  late List<String> labels;

  MLService({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();
    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }
    final options = FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);
    initialize();
  }

  Future<void> initialize() async {
    user = await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
  }

  void registerFaceInDB(List<double> embedding) async {
    user!.embeddings = embedding;
    await LocalDb()
        .saveUser(user!, getStringAsync('USER_ID', defaultValue: ''));
  }

  Future<void> loadModel({String? modelName, int? numThreads}) async {
    interpreter = await Interpreter.fromAsset(
      modelName ?? 'assets/mobilefacenet.tflite',
    );
  }

  // load labels
  Future<void> loadLabels() async {
    final labelTxt = await rootBundle.loadString('assets/labels.txt');
    labels = labelTxt.split('\n');
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (pixel.r - mean) / std;
        buffer[pixelIndex++] = (pixel.g - mean) / std;
        buffer[pixelIndex++] = (pixel.b - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  List<dynamic> imageToArray(img.Image inputImage, int width, int height) {
    img.Image resizedImage =
        img.copyResize(inputImage, width: width, height: height);
    List<double> flattenedList = resizedImage.data!
        .expand((channel) => [channel.r, channel.g, channel.b])
        .map((value) => value.toDouble())
        .toList();
    Float32List float32Array = Float32List.fromList(flattenedList);
    int channels = 3;
    Float32List reshapedArray = Float32List(1 * height * width * channels);
    for (int c = 0; c < channels; c++) {
      for (int h = 0; h < height; h++) {
        for (int w = 0; w < width; w++) {
          int index = c * height * width + h * width + w;
          reshapedArray[index] =
              (float32Array[c * height * width + h * width + w] - 127.5) /
                  127.5;
        }
      }
    }
    return reshapedArray.reshape([1, 112, 112, 3]);
  }

  List<double> getEmbeddings(img.Image image) {
    List input = imageToArray(image, 112, 112);
    List output = List.filled(1 * 192, 0).reshape([1, 192]);
    interpreter.run(input, output);
    interpreter.close();
    log(List.from(output.reshape([192])).toString());
    return List.from(output.reshape([192]));
  }

  Future<bool> compareFaces(img.Image capturedImage) async {
    List<double> embeddings = getEmbeddings(capturedImage);
    List<double> userEmbeddings = user!.embeddings!;
    double distance = euclideanDistance(embeddings, userEmbeddings);
    double threshold = 1.0;
    if (distance <= threshold) {
      return true;
    } else {
      return false;
    }
  }

  double euclideanDistance(List<double> embeddings1, List<double> embeddings2) {
    double sum = 0.0;
    for (int i = 0; i < embeddings1.length; i++) {
      double diff = embeddings1[i] - embeddings2[i];
      sum += diff * diff;
    }
    return sqrt(sum);
  }

  Future<void> doFaceDetection(File? image) async {
    File? image0 = await removeRotation(image!);
    final Uint8List bytes = await image0.readAsBytes();
    final capturedImage = img.decodeImage(bytes)!;

    InputImage inputImage = InputImage.fromFile(image0);

    faces = await faceDetector.processImage(inputImage);

    if (faces.isEmpty) {
      return;
    }

    for (Face face in faces) {
      final Rect faceRect = face.boundingBox;
      num left = faceRect.left < 0 ? 0 : faceRect.left;
      num top = faceRect.top < 0 ? 0 : faceRect.top;
      num right = faceRect.right > capturedImage.width
          ? capturedImage.width - 1
          : faceRect.right;
      num bottom = faceRect.bottom > capturedImage.height
          ? capturedImage.height - 1
          : faceRect.bottom;
      num width = right - left;
      num height = bottom - top;

      cropedFace = img.copyCrop(capturedImage,
          x: left.toInt(),
          y: top.toInt(),
          width: width.toInt(),
          height: height.toInt());

      return;
    }
  }

  Future<bool> doMaskDetection() async {
    await loadModel(modelName: 'assets/mask_detector.tflite');
    await loadLabels();
    List input = imageToArray(cropedFace!, 112, 112);
    List output = List.filled(1 * 2, 0).reshape([1, 2]);
    interpreter.run(input, output);
    interpreter.close();
    final predictionResult = output[0] as List<double>;
    if (predictionResult[0] > predictionResult[1]) {
      return true;
    } else {
      return false;
    }
  }

  Future<File> removeRotation(File inputImage) async {
    final img.Image? capturedImage =
        img.decodeImage(await File(inputImage.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(inputImage.path)
        .writeAsBytes(img.encodeJpg(orientedImage));
  }
}
