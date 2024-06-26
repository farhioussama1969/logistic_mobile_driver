import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class BottomSheetComponent {
  static void show(
    BuildContext context, {
    required Widget body,
    double? height,
    bool? dismissible,
    double? horizontalMargin,
    Color? backgroundColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: dismissible ?? true,
      enableDrag: false,
      backgroundColor: MainColors.transparentColor,
      builder: (context) {
        return PopScope(
          canPop: dismissible ?? true,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 0,
                  maxHeight: 0.8.sh,
                ),
                child: body,
              ),
            ),
          ),
        );
      },
    );
  }
}
