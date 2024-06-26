import 'package:get/get.dart';

import '../controllers/banned_controller.dart';

class BannedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannedController>(
      () => BannedController(),
    );
  }
}
