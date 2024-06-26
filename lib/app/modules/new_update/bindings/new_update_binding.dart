import 'package:get/get.dart';

import '../controllers/new_update_controller.dart';

class NewUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewUpdateController>(
      () => NewUpdateController(),
    );
  }
}
