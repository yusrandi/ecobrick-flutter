import 'package:get/get.dart';

import '../../quiz/controllers/quiz_controller.dart';

class ResultController extends GetxController {
  RxList<JawabanModel> listJawaban = <JawabanModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    listJawaban.value = Get.arguments;
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
}
