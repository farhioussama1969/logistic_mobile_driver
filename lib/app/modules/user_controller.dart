import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/constants/firebase_messaging_tobics_constants.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/app_version_info_service.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/user_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/auth_provider.dart' as auth;
import 'package:loogisti/app/modules/config_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class UserController extends GetxController {
  UserModel? user;

  initialize({bool? skipUpdateChecker}) async {
    if (await LocalStorageService.loadData(key: StorageKeysConstants.serverApiToken, type: DataTypes.string) != null) {
      log(await LocalStorageService.loadData(key: StorageKeysConstants.serverApiToken, type: DataTypes.string));
      await auth.AuthProvider().getUserData().then((user) {
        if (user != null) {
          setUser(user);
          Get.offAllNamed(Routes.HOME);
        }
      });
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }

  Future<void> setUser(UserModel user) async {
    this.user = user;
    update([GetBuildersIdsConstants.userInfosComponents]);
    await LocalStorageService.saveData(
      key: StorageKeysConstants.userData,
      value: jsonEncode(user.toJson()),
      type: DataTypes.string,
    );
    log('User data: ${this.user?.toJson()}');
  }

  void refreshUserData() {
    auth.AuthProvider().getUserData(onLoading: () {}, onFinal: () {}).then((user) {
      if (user != null) {
        setUser(user);
      }
    });
  }

  bool logoutLoading = false;
  void changeLogoutLoading(bool value) {
    logoutLoading = value;
    update([GetBuildersIdsConstants.logoutConfirmationWindow]);
  }

  Future<void> clearUser({bool? withoutLogout, bool? deleteAccount}) async {
    if (withoutLogout != true) {
      await auth.AuthProvider().logout(
        onLoading: () => changeLogoutLoading(true),
        onFinal: () => changeLogoutLoading(false),
      );
    }
    if (deleteAccount == true) {
      await auth.AuthProvider().deleteAccount(
        onLoading: () => changeLogoutLoading(true),
        onFinal: () => changeLogoutLoading(false),
      );
    }
    await LocalStorageService.deleteData(key: StorageKeysConstants.userData);
    await LocalStorageService.deleteData(key: StorageKeysConstants.serverApiToken);
    await LocalStorageService.deleteData(key: StorageKeysConstants.fcmToken);
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    user = null;
    FirebaseMessaging.instance.getToken().then((token) async {
      LocalStorageService.saveData(key: StorageKeysConstants.fcmToken, type: DataTypes.string, value: token);
    });

    Get.offAllNamed(Routes.SIGN_IN);
  }
}
