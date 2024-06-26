import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:loogisti/app/core/constants/animations_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../controllers/banned_controller.dart';

class BannedView extends GetView<BannedController> {
  const BannedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AnimationsAssetsConstants.errorAnimation,
            width: 300.r,
            repeat: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Text(
                StringsAssetsConstants.yourAccountIsBanned,
                style: TextStyles.mediumLabelTextStyle(context),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: Text(
                StringsAssetsConstants.bannedAccountText,
                style: TextStyles.largeBodyTextStyle(context),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
