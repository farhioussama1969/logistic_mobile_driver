import 'package:get/get.dart';

import '../controllers/my_personnel_information_controller.dart';

class MyPersonnelInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPersonnelInformationController>(
      () => MyPersonnelInformationController(),
    );
  }
}
