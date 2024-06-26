import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../buttons/icon_button_component.dart';

class ConfirmWindowComponent extends StatelessWidget {
  const ConfirmWindowComponent(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onCancel,
      required this.onConfirm,
      this.isLoading,
      this.baseColor,
      this.iconPath,
      this.iconColor});

  final String title;
  final String subtitle;
  final Function onCancel;
  final Function onConfirm;
  final bool? isLoading;
  final Color? baseColor;
  final String? iconPath;
  final String? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadiusDirectional.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                SvgPicture.asset(
                  iconPath ?? IconsAssetsConstants.infoIcon,
                  width: 100.r,
                  color: null,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    title,
                    style: TextStyles.mediumLabelTextStyle(context),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: AnimatedTypeTextComponent(
                    text: subtitle,
                    textStyle: TextStyles.mediumBodyTextStyle(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryButtonComponent(
                    onTap: () => onConfirm(),
                    isLoading: isLoading ?? false,
                    text: StringsAssetsConstants.confirm,
                    disableShadow: true,
                    backgroundColor: baseColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryButtonComponent(
                    onTap: () => onCancel(),
                    text: StringsAssetsConstants.cancel,
                    backgroundColor: MainColors.transparentColor,
                    disableShadow: true,
                    textColor: baseColor ?? MainColors.primaryColor,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButtonComponent(
                onTap: () => Get.back(),
                iconLink: IconsAssetsConstants.closeIcon,
                buttonWidth: 23.r,
                buttonHeight: 23.r,
                iconWidth: 15.r,
                iconHeight: 15.r,
                backgroundColor: MainColors.disableColor(context)?.withOpacity(0.5),
                iconColor: MainColors.whiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
