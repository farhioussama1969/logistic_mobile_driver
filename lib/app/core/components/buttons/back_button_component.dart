import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class BackButtonComponent extends StatelessWidget {
  final Function? onTap;
  final bool? isCloseButton;
  final Color? backgroundColor;
  final Color? iconColor;

  const BackButtonComponent({
    Key? key,
    this.onTap,
    this.isCloseButton,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50.r,
      height: 50.r,
      decoration: BoxDecoration(
          color: backgroundColor ?? MainColors.backgroundColor(context),
          borderRadius: BorderRadius.circular(1000.r),
          boxShadow: [
            BoxShadow(
              color: MainColors.blackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000.r)),
          backgroundColor: MainColors.transparentColor,
          primary: MainColors.primaryColor,
        ),
        onPressed: () => (onTap == null) ? Get.back() : onTap!(),
        child: Center(
          child: SvgPicture.asset(
            isCloseButton == true
                ? IconsAssetsConstants.closeIcon
                : Get.locale?.languageCode == 'ar'
                    ? IconsAssetsConstants.arrowRightIcon
                    : IconsAssetsConstants.arrowLeftIcon,
            color: iconColor ?? MainColors.textColor(context),
            width: 30.sp,
          ),
        ),
      ),
    );
  }
}
