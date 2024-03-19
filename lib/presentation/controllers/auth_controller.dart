import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../core/request.dart';
import '../../core/service_locator.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/entities/ad_clientinfo.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_model.dart';
import '../../utils/local_db.dart';

class AuthController extends GetxController {
  final _authrepository = serviceLocator<AuthRepository>();

  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;
  final Rxn<UserModel?> user = Rxn<UserModel>();
  final Rxn<AdClientinfo?> client = Rxn<AdClientinfo>();

  @override
  void onInit() {
    isLoading.value = false;
    rememberMe.value = getBoolAsync('REMEMBER_ME', defaultValue: false);
    super.onInit();
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    final response = await _authrepository.login(username, password);
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
        if (rememberMe.value) {
          setValue('REMEMBER_ME', true);
          setValue('USERNAME', username);
          setValue('PASSWORD', password);
        } else {
          setValue('REMEMBER_ME', false);
          setValue('USERNAME', '');
          setValue('PASSWORD', '');
        }
        await getProfile();
        var userExists = await LocalDb()
            .getUser(getStringAsync('USER_ID', defaultValue: ''));
        if (userExists == null) {
          await LocalDb().saveUser(
            User(
              NIP: user.value!.NIP,
              EmployeeName: user.value!.EmployeeName,
              embeddings: null,
              C_BPartner_ID: user.value!.C_BPartner_ID!.id.toString(),
            ),
            getStringAsync('USER_ID', defaultValue: ''),
          );
          Get.offNamed('/face_register');
        } else if (userExists.embeddings == null) {
          Get.offNamed('/face_register');
        } else {
          Get.offNamed('/dashboard');
        }
      },
    );
    isLoading.value = false;
  }

  Future<void> getProfile() async {
    String userId = getStringAsync('USER_ID', defaultValue: '');
    final response = await _authrepository.getProfile(userId);
    response.fold(
      (failure) {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
        if (failure.code == 401 ||
            failure.code == 403 ||
            failure.code == 404 ||
            failure.code == 500) {
          logout();
        }
      },
      (data) async {
        user.value = data;
      },
    );
  }

  Future<void> getCompanyProfile() async {
    final response = await _authrepository.getCompanyProfile();
    response.fold(
      (failure) {
        Get.defaultDialog(
          title: 'Error',
          content: Text(failure.message),
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
      },
      (data) {
        client.value = data.data['ad_client'];
      },
    );
  }

  Future<void> logout() async {
    await setValue('TOKEN', '');
    await setValue('USER_ID', '');
    Get.offAllNamed('/login');
  }

  Future<void> putBiometric(
      List<double> biometrics, String image, User user) async {
    isLoading.value = true;
    var name = '${user.NIP}.jpg';
    final response = await _authrepository.putBiometric(
        biometrics, name, image, user.C_BPartner_ID!);
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
      return token.isNotEmpty;
    }
    return false;
  }
}
