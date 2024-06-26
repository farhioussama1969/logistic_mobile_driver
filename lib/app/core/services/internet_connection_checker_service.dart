import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCheckerService {
  static bool backFromNoConnectionScreen = false;
  static void checkConnectionStream() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      InternetConnectionChecker.createInstance(
        checkTimeout: const Duration(seconds: 10),
        checkInterval: const Duration(seconds: 10),
      ).onStatusChange.listen((connectionStatus) {
        switch (connectionStatus) {
          case InternetConnectionStatus.connected:
            // if (backFromNoConnectionScreen == true) {
            //   if (Get.previousRoute == Routes.SPLASH) {
            //     Get.offAllNamed(Routes.SPLASH);
            //   } else {
            //     Get.back();
            //   }
            // }
            break;
          case InternetConnectionStatus.disconnected:
            // Get.to(() => const NoConnectionScreenComponent());
            backFromNoConnectionScreen = true;
            break;
        }
      });
    });
  }
}
