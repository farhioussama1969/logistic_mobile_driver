import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../styles/main_colors.dart';

class DialogComponent {
  void show(
    BuildContext? context, {
    required Widget body,
    double? height,
    bool? dismissible,
    double? horizontalMargin,
    Color? backgroundColor,
  }) {
    Get.dialog(
      barrierColor: MainColors.blackColor.withOpacity(0.9),
      transitionCurve: Curves.easeInOut,
      WillPopScope(
        onWillPop: () async => dismissible ?? true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height,
              margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 30.w),
              decoration: BoxDecoration(
                color: (context != null)
                    ? backgroundColor ?? MainColors.backgroundColor(context)
                    : MainColors.transparentColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: body,
            ),
          ],
        ),
      ),
      barrierDismissible: dismissible ?? true,
    );
  }
}
