import 'package:get/get.dart';

import '../controllers/pick_location_controller.dart';

class PickLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickLocationController>(
      () => PickLocationController(),
    );
  }
}
