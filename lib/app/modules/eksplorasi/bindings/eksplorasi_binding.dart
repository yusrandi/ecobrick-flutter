import 'package:get/get.dart';

import '../controllers/eksplorasi_controller.dart';

class EksplorasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EksplorasiController>(
      () => EksplorasiController(),
    );
  }
}
