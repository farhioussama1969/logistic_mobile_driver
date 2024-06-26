import 'package:get/get.dart';

import '../controllers/create_new_order_controller.dart';

class CreateNewOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewOrderController>(
      () => CreateNewOrderController(),
    );
  }
}
