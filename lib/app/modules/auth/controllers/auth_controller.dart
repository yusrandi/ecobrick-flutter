import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user_service.dart';

class AuthController extends GetxController {
  RxBool passwordVisible = false.obs;
  Rx<Status> status = Status.none.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<String> userDaftar(UserModel user, String pass) async {
    status.value = Status.running;
    var msg = await UserService().userRegis(user, pass);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, msg,
        backgroundColor: CoreColor.whiteSoft,
        duration: const Duration(seconds: 2));

    print(msg);
    return msg;
  }

  Future<String> userLogin(String nis, String pass) async {
    status.value = Status.running;
    var msg = await UserService().userLogin(nis, pass);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, msg,
        backgroundColor: CoreColor.whiteSoft,
        duration: const Duration(seconds: 2));

    print(msg);
    return msg;
  }
}

enum Status { none, running, stopped, paused }
