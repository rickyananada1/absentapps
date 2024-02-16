import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'auth_controller.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.put(AuthController());

  RxBool dataFetched = false.obs;
  int offset = 0;
  int limit = 100;
  RxBool isLoading = false.obs;
  bool hasMore = true;

  Future<void> loadData() async {
    if (!dataFetched.value) {
      // Fetch data using GetX controllers
      await authController
          .getProfile(getStringAsync('USER_ID', defaultValue: ''));

      dataFetched.value = true;
    } else {
      isLoading.value = true;
      await authController
          .getProfile(getStringAsync('USER_ID', defaultValue: ''));
      isLoading.value = false;
    }
  }
}
