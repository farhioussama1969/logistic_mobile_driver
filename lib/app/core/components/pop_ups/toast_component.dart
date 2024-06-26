import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../../constants/icons_assets_constants.dart';

class ToastComponent {
  static void showSuccessToast(BuildContext context, {required String text}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 12.r,
        margin: EdgeInsets.all(10.r),
        duration: const Duration(milliseconds: 2000),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: MainColors.successColor(context),
        isDismissible: true,
        titleText: const Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 0),
        ),
        boxShadows: [
          BoxShadow(
            color: MainColors.textColor(context)!.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20.r,
            offset: const Offset(0, 0),
          ),
        ],
        padding: EdgeInsets.only(
          bottom: 20.h,
          top: 10.h,
          left: 25.w,
          right: 25.w,
        ),
        messageText: Row(
          children: [
            SvgPicture.asset(
              IconsAssetsConstants.successIcon,
              color: Colors.white,
              width: 20.r,
              height: 20.r,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Get.width - 115,
              child: Text(
                text,
                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                  color: MainColors.whiteColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }
  }

  static void showErrorToast(BuildContext context, {required String text}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 12.r,
        margin: EdgeInsets.all(10.r),
        duration: const Duration(milliseconds: 2000),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: MainColors.errorColor(context),
        isDismissible: true,
        titleText: const Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 0),
        ),
        boxShadows: [
          BoxShadow(
            color: MainColors.textColor(context)!.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20.r,
            offset: const Offset(0, 0),
          ),
        ],
        padding: EdgeInsets.only(
          bottom: 20.h,
          top: 10.h,
          left: 25.w,
          right: 25.w,
        ),
        messageText: Row(
          children: [
            SvgPicture.asset(
              IconsAssetsConstants.errorIcon,
              color: Colors.white,
              width: 20.r,
              height: 20.r,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Get.width - 115,
              child: Text(
                text,
                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                  color: MainColors.whiteColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }
  }

  static void showInfoToast(BuildContext context, {required String text, String? title}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 12.r,
        margin: EdgeInsets.all(10.r),
        duration: const Duration(milliseconds: 2000),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: MainColors.infoColor(context),
        isDismissible: true,
        titleText: const Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 0),
        ),
        boxShadows: [
          BoxShadow(
            color: MainColors.textColor(context)!.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20.r,
            offset: const Offset(0, 0),
          ),
        ],
        padding: EdgeInsets.only(
          bottom: 20.h,
          top: 10.h,
          left: 25.w,
          right: 25.w,
        ),
        messageText: Row(
          children: [
            SvgPicture.asset(
              IconsAssetsConstants.infoIcon,
              color: Colors.white,
              width: 20.r,
              height: 20.r,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Get.width - 115,
              child: Text(
                text,
                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                  color: MainColors.whiteColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }
  }
}
