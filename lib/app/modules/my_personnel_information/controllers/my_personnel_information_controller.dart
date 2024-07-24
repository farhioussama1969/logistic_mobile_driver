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
  final FocusNode carTypeFocusNode = FocusNode();
  final FocusNode licenseExpiryDateFocusNode = FocusNode();
  final FocusNode blackCardFocusNode = FocusNode();
  final FocusNode registerNumberFocusNode = FocusNode();
  final FocusNode nextInspectionDateFocusNode = FocusNode();
  final FocusNode insuranceExpiryDateFocusNode = FocusNode();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();
  final TextEditingController licenseExpiryDateController = TextEditingController();
  final TextEditingController blackCardController = TextEditingController();
  final TextEditingController registerNumberController = TextEditingController();
  final TextEditingController nextInspectionDateController = TextEditingController();
  final TextEditingController insuranceExpiryDateController = TextEditingController();

  DateTime? licenseExpiryDate;
  void setLicenseExpiryDate(DateTime? value) {
    licenseExpiryDate = value;
    update([GetBuildersIdsConstants.myPersonnelInformationDates]);
  }

  DateTime? nextInspectionDate;
  void setInsuranceExpiryDate(DateTime? value) {
    nextInspectionDate = value;
    update([GetBuildersIdsConstants.myPersonnelInformationDates]);
  }

  DateTime? insuranceExpiryDate;
  void setNextInspectionDate(DateTime? value) {
    insuranceExpiryDate = value;
    update([GetBuildersIdsConstants.myPersonnelInformationDates]);
  }

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

  void fillUserDetails() {
    fullNameController.text = Get.find<UserController>().user?.fullname ?? '';
    phoneNumberController.text = Get.find<UserController>().user?.phone ?? '';
    carTypeController.text = Get.find<UserController>().user?.typeCar ?? '';
    licenseExpiryDateController.text = Get.find<UserController>().user?.licenseExpiryDate ?? '';
    blackCardController.text = Get.find<UserController>().user?.blackCard ?? '';
    registerNumberController.text = Get.find<UserController>().user?.registerNumber ?? '';
    nextInspectionDateController.text = Get.find<UserController>().user?.nextInspectionDate ?? '';
    insuranceExpiryDateController.text = Get.find<UserController>().user?.insuranceExpiryDate ?? '';
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
      blackCard: blackCardController.text,
      carType: carTypeController.text,
      insuranceExpiryDate: insuranceExpiryDateController.text,
      licenseExpiryDate: licenseExpiryDateController.text,
      nextInspectionDate: nextInspectionDateController.text,
      registerNumber: registerNumberController.text,
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
