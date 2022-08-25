import 'package:get/get.dart';

class DetailController extends GetxController {
  final count = 0.obs;
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    index.value = Get.arguments;
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
