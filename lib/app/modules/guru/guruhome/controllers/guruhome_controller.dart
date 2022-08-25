import 'package:ecobrick_app/app/data/models/home_model.dart';
import 'package:ecobrick_app/app/data/services/home_service.dart';
import 'package:get/get.dart';

class GuruhomeController extends GetxController {
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

  Future<HomeModel> getHomeA() async {
    return await HomeService().getHome();
  }
}
