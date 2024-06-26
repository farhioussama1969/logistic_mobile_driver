import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class TextStyles {
  static TextStyle smallBodyTextStyle(BuildContext context) => TextStyle(
        fontSize: 13.sp,
        overflow: TextOverflow.clip,
        fontFamily: FontsFamilyAssetsConstants.regular,
        color: MainColors.textColor(context),
      );
  static TextStyle mediumBodyTextStyle(BuildContext context) => TextStyle(
        fontSize: 15.sp,
        overflow: TextOverflow.clip,
        fontFamily: FontsFamilyAssetsConstants.regular,
        color: MainColors.textColor(context),
      );
  //create another styles here
  static TextStyle largeBodyTextStyle(BuildContext context) => TextStyle(
        fontSize: 17.sp,
        overflow: TextOverflow.clip,
        fontFamily: FontsFamilyAssetsConstants.regular,
        color: MainColors.textColor(context),
      );

  static TextStyle buttonTextStyle(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        overflow: TextOverflow.clip,
        fontFamily: FontsFamilyAssetsConstants.bold,
        color: MainColors.textColor(context),
      );

  static TextStyle smallLabelTextStyle(BuildContext context) => TextStyle(
        height: 1.72,
        fontSize: 15.sp,
        overflow: TextOverflow.ellipsis,
        fontFamily: FontsFamilyAssetsConstants.bold,
        fontWeight: FontWeight.bold,
        color: MainColors.textColor(context),
      );

  static TextStyle mediumLabelTextStyle(BuildContext context) => TextStyle(
        fontSize: 20.sp,
        overflow: TextOverflow.ellipsis,
        fontFamily: FontsFamilyAssetsConstants.bold,
        fontWeight: FontWeight.bold,
        color: MainColors.textColor(context),
      );

  static TextStyle largeLabelTextStyle(BuildContext context) => TextStyle(
        fontSize: 32.sp,
        overflow: TextOverflow.ellipsis,
        fontFamily: FontsFamilyAssetsConstants.bold,
        fontWeight: FontWeight.bold,
        color: MainColors.textColor(context),
      );
}
