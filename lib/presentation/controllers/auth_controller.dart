import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../core/request.dart';
import '../../core/service_locator.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_model.dart';
import '../../utils/local_db.dart';

class AuthController extends GetxController {
  final _apiProvider = serviceLocator<AuthRepository>();

  final RxBool isLoading = false.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  @override
  void onInit() {
    isLoading.value = false;
    super.onInit();
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
        serviceLocator<Request>()
            .updateAuthorization(data.data['data']['access_token']);
        setValue('TOKEN', data.data['data']['access_token']);
        setValue('USER_ID', data.data['data']['userId'].toString());
        await getProfile();
        // check if user exists in local db
        // if not, save user to local db
        await checkUser();
        Get.offNamed('/face_scan');
      },
    );
  }

  Future<void> getProfile() async {
    String userId = getStringAsync('USER_ID', defaultValue: '');
    final response = await _apiProvider.getProfile(userId);
    response.fold(
      (failure) async {
        if (failure.code == 401) {
          await logout();
        }
      },
      (data) async {
        user.value = data;
      },
    );
  }

  Future<void> logout() async {
    await setValue('TOKEN', '');
    await setValue('USER_ID', '');
    Get.offAllNamed('/login');
  }

  Future<void> postImages(String image, User user) async {
    isLoading.value = true;
    var name = '${user.NIP}.jpg';
    var description = 'Face Image of ${user.NIP}';
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

  Future<bool> checkLogin() async {
    var token = getStringAsync('TOKEN', defaultValue: '');
    if (token.isNotEmpty) {
      serviceLocator<Request>().updateAuthorization(token);
      await getProfile();
    }
    return token.isNotEmpty;
  }

  Future<void> checkUser() async {
    var userExists =
        await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: ''));
    if (userExists == null) {
      await LocalDb().saveUser(
          User(
            NIP: user.value!.NIP,
            EmployeeName: user.value!.EmployeeName,
            embeddings: null,
            C_BPartner_ID: user.value!.C_BPartner_ID!.id.toString(),
          ),
          getStringAsync('USER_ID', defaultValue: ''));
    } else {
      await LocalDb().saveUser(
          User(
            NIP: user.value!.NIP,
            EmployeeName: user.value!.EmployeeName,
            embeddings: userExists.embeddings,
            C_BPartner_ID: user.value!.C_BPartner_ID!.id.toString(),
          ),
          getStringAsync('USER_ID', defaultValue: ''));
    }
  }
}
