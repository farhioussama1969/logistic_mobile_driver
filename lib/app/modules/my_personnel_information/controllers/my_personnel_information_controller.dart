import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/data/providers/loogistic_api/auth_provider.dart';
import 'package:loogisti/app/modules/user_controller.dart';

import '../views/components/gander_selector_window_component.dart';

class MyPersonnelInformationController extends GetxController {
  final GlobalKey<FormState> formFormKey = GlobalKey<FormState>();

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode ganderFocusNode = FocusNode();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ganderController = TextEditingController();

  bool updateMyPersonnelInformationLoading = false;
  void changeUpdateMyPersonnelInformationLoading(bool value) {
    updateMyPersonnelInformationLoading = value;
    update([GetBuildersIdsConstants.updateMyPersonnelInformationButton]);
  }

  File? avatarFile;
  void setAvatarFile(File? value) {
    avatarFile = value;
    update([GetBuildersIdsConstants.myPersonnelInformationAvatar]);
  }

  GanderType? selectedGander;
  void changeSelectedGander(GanderType gander) {
    selectedGander = gander;
    ganderController.text = (gander == GanderType.male) ? StringsAssetsConstants.male : StringsAssetsConstants.female;
    update([GetBuildersIdsConstants.profileGanderWindow]);
  }

  void fillUserDetails() {
    fullNameController.text = Get.find<UserController>().user?.fullname ?? '';
    phoneNumberController.text = Get.find<UserController>().user?.phoneNumber ?? '';
    if (Get.find<UserController>().user?.gender == 'male' || Get.find<UserController>().user?.gender == 'female') {
      changeSelectedGander(Get.find<UserController>().user?.gender == 'male' ? GanderType.male : GanderType.female);
    }
  }

  void updateUserData() {
    if (updateMyPersonnelInformationLoading) return;
    if (!formFormKey.currentState!.validate()) {
      return;
    }
    AuthProvider()
        .updateUserData(
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      gender: selectedGander == GanderType.male ? 'male' : 'female',
      avatarFile: avatarFile,
      onLoading: () => changeUpdateMyPersonnelInformationLoading(true),
      onFinal: () => changeUpdateMyPersonnelInformationLoading(false),
    )
        .then((user) {
      if (user != null) {
        Get.find<UserController>().setUser(user);
        Get.back();
        ToastComponent.showSuccessToast(Get.context!, text: StringsAssetsConstants.updatePersonalInformationSuccess);
      }
    });
  }

  @override
  void onInit() {
    fillUserDetails();
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
