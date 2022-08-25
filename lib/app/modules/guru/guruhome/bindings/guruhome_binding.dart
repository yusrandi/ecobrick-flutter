import 'package:get/get.dart';

import '../controllers/guruhome_controller.dart';

class GuruhomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuruhomeController>(
      () => GuruhomeController(),
    );
  }
}
