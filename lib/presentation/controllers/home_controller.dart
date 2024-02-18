import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/local_db.dart';
import 'auth_controller.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.put(AuthController());

  RxBool dataFetched = false.obs;
  int offset = 0;
  int limit = 100;
  RxBool isLoading = false.obs;
  bool hasMore = true;
  RxString fingerType = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    if (!dataFetched.value) {
      await authController.getProfile();
      await authController.checkLastActivity();
      await getFingerType();
      dataFetched.value = true;
    } else {
      isLoading.value = true;
      await authController.getProfile();
      await authController.checkLastActivity();
      await getFingerType();
      isLoading.value = false;
    }
  }

  Future<void> getFingerType() async {
    var user =
        (await LocalDb().getUser(getStringAsync('USER_ID', defaultValue: '')))!;
    fingerType.value = user.fingerType!;
  }
}
