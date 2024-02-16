import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../core/request.dart';
import '../../core/service_locator.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/entities/user_model.dart';
import '../../utils/local_db.dart';

class AuthController extends GetxController {
  final _apiProvider = serviceLocator<AuthRepository>();

  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() async {
    await checkLogin();
    super.onReady();
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    final response = await _apiProvider.login(username, password);
    isLoading.value = false;
    response.fold(
      (failure) async {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      },
      (data) async {
        isLoggedIn.value = true;
        serviceLocator<Request>()
            .updateAuthorization(data.data['data']['access_token']);
        setValue('TOKEN', data.data['data']['access_token']);
        setValue('USER_ID', data.data['data']['userId'].toString());
        setValue('IS_LOGGED_IN', true);
        await getProfile(data.data['data']['userId'].toString());
        await LocalDb().saveUser(User(
          username: username,
        ));
        Get.offNamed('/face_scan');
      },
    );
  }

  Future<void> getProfile(String userId) async {
    final response = await _apiProvider.getProfile(userId);
    response.fold(
      (failure) async {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
        if (failure.code == 401) {
          // logout();
        }
      },
      (data) async {
        user.value = data;
      },
    );
  }

  Future<void> postImages(String image) async {
    isLoading.value = true;
    var name = '${user.value!.username}.jpg';
    var description = 'Face Image of ${user.value!.username}';
    final response = await _apiProvider.postImages(name, description, image);
    isLoading.value = false;
    response.fold(
      (failure) async {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      },
      (data) async {
        Get.back();
        Get.snackbar("Face Registered", "Face Registered",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offNamed('/dashboard');
      },
    );
  }

  Future<void> checkLogin() async {
    final token = getStringAsync('TOKEN');
    if (token.isNotEmpty) {
      serviceLocator<Request>().updateAuthorization(token);
      final userId = getStringAsync('USER_ID', defaultValue: '');
      await getProfile(userId);
      isLoggedIn.value = true;
    }
  }
}
