import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/inputs/date_input_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/components/windows/confirm_window_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/utils/validator_util.dart';
import 'package:loogisti/app/modules/my_personnel_information/views/components/gander_selector_window_component.dart';
import 'package:loogisti/app/modules/my_personnel_information/views/components/profile_avatar_component.dart';
import 'package:loogisti/app/modules/user_controller.dart';

import '../controllers/my_personnel_information_controller.dart';

class MyPersonnelInformationView extends GetView<MyPersonnelInformationController> {
  const MyPersonnelInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.myPersonalInformation,
      ),
      body: SizedBox(
        width: double.infinity,
        child: ScrollableBodyComponent(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 10.h),
            GetBuilder<MyPersonnelInformationController>(
                id: GetBuildersIdsConstants.myPersonnelInformationAvatar,
                builder: (logic) {
                  return ProfileAvatarComponent(
                    avatarLink: Get.find<UserController>().user?.photo ?? '',
                    pickedAvatarFile: logic.avatarFile,
                    onPickAvatarFile: (file) => logic.setAvatarFile(file),
                    loading: false,
                  );
                }),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Divider(color: MainColors.textColor(context)!.withOpacity(0.3), height: 1.h),
            ),
            SizedBox(height: 40.h),
            Form(
              key: controller.formFormKey,
              child: Column(
                children: [
                  TextInputComponent(
                    focusNode: controller.fullNameFocusNode,
                    controller: controller.fullNameController,
                    nextNode: controller.phoneNumberFocusNode,
                    label: StringsAssetsConstants.fullName,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.fullName}...',
                    validate: (value) => ValidatorUtil.stringLengthValidation(value, 3,
                        customMessage: '${StringsAssetsConstants.check} ${StringsAssetsConstants.fullName}'),
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    focusNode: controller.phoneNumberFocusNode,
                    controller: controller.phoneNumberController,
                    nextNode: controller.carTypeFocusNode,
                    label: StringsAssetsConstants.phoneNumber,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.phoneNumber}...',
                    validate: (value) => ValidatorUtil.phoneValidation(value,
                        customMessage: '${StringsAssetsConstants.check} ${StringsAssetsConstants.phoneNumber}'),
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    focusNode: controller.carTypeFocusNode,
                    controller: controller.carTypeController,
                    nextNode: controller.licenseExpiryDateFocusNode,
                    label: StringsAssetsConstants.carType,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.carType}...',
                  ),
                  SizedBox(height: 15.h),
                  GetBuilder<MyPersonnelInformationController>(
                    id: GetBuildersIdsConstants.myPersonnelInformationDates,
                    builder: (logic) {
                      return DateInputComponent(
                        focusNode: controller.licenseExpiryDateFocusNode,
                        textController: controller.licenseExpiryDateController,
                        nextNode: controller.blackCardFocusNode,
                        borderColor: MainColors.textColor(context),
                        label: StringsAssetsConstants.licenseExpiryDate,
                        hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.licenseExpiryDate}...',
                        selectedDate: controller.licenseExpiryDate,
                        callBack: (date) => controller.setLicenseExpiryDate(date),
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    focusNode: controller.blackCardFocusNode,
                    controller: controller.blackCardController,
                    nextNode: controller.registerNumberFocusNode,
                    label: StringsAssetsConstants.blackCard,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.blackCard}...',
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    focusNode: controller.registerNumberFocusNode,
                    controller: controller.registerNumberController,
                    nextNode: controller.nextInspectionDateFocusNode,
                    label: StringsAssetsConstants.registerNumber,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.registerNumber}...',
                  ),
                  SizedBox(height: 15.h),
                  GetBuilder<MyPersonnelInformationController>(
                    id: GetBuildersIdsConstants.myPersonnelInformationDates,
                    builder: (logic) {
                      return DateInputComponent(
                        focusNode: controller.nextInspectionDateFocusNode,
                        textController: controller.nextInspectionDateController,
                        nextNode: controller.insuranceExpiryDateFocusNode,
                        borderColor: MainColors.textColor(context),
                        label: StringsAssetsConstants.nextInspectionDate,
                        hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.nextInspectionDate}...',
                        selectedDate: controller.nextInspectionDate,
                        callBack: (date) => controller.setNextInspectionDate(date),
                      );
                    },
                  ),
                  SizedBox(height: 15.h),
                  GetBuilder<MyPersonnelInformationController>(
                    id: GetBuildersIdsConstants.myPersonnelInformationDates,
                    builder: (logic) {
                      return DateInputComponent(
                        focusNode: controller.insuranceExpiryDateFocusNode,
                        textController: controller.insuranceExpiryDateController,
                        nextNode: controller.insuranceExpiryDateFocusNode,
                        borderColor: MainColors.textColor(context),
                        label: StringsAssetsConstants.insuranceExpiryDate,
                        hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.insuranceExpiryDate}...',
                        selectedDate: controller.insuranceExpiryDate,
                        callBack: (date) => controller.setInsuranceExpiryDate(date),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.w, end: 5.w, top: 20.h, bottom: 50.h),
              child: GetBuilder<MyPersonnelInformationController>(
                id: GetBuildersIdsConstants.updateMyPersonnelInformationButton,
                builder: (logic) {
                  return PrimaryButtonComponent(
                    onTap: () => logic.updateUserData(),
                    text: StringsAssetsConstants.save,
                    isLoading: logic.updateMyPersonnelInformationLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
