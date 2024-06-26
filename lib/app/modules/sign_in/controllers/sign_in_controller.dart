import 'dart:developer';

import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/services/firebase_authentication_service.dart';
import 'package:loogisti/app/data/providers/loogistic_api/auth_provider.dart';
import 'package:loogisti/app/modules/user_controller.dart';

class SignInController extends GetxController {
  bool googleSignInLoading = false;
  void changeGoogleSignInLoading(bool value) {
    googleSignInLoading = value;
    update([GetBuildersIdsConstants.signInGoogleButton]);
  }

  void signInWithGoogle() {
    if (googleSignInLoading) return;
    FirebaseAuthenticationService()
        .googleAuthentication(onLoading: () => changeGoogleSignInLoading(true), onFinal: () => changeGoogleSignInLoading(false))
        .then((auth) async {
      if (auth?.firebaseUserCredential != null) {
        log('${await auth?.firebaseUserCredential?.user?.getIdToken()}');
        AuthProvider()
            .socialLogin(
          firebaseAuthToken: await auth?.firebaseUserCredential?.user?.getIdToken(),
          onLoading: () => changeGoogleSignInLoading(true),
          onFinal: () => changeGoogleSignInLoading(false),
        )
            .then((user) async {
          if (user != null) {
            await Get.find<UserController>().setUser(user);
            await Get.find<UserController>().initialize(skipUpdateChecker: true);
          }
        });
      }
    });
  }

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
}
