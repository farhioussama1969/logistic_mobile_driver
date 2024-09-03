import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

import '../../../core/styles/text_styles.dart';
import '../animations/loading_component.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent(
      {Key? key,
      required this.onTap,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.gradient,
      this.borderRadius,
      this.width,
      this.height,
      this.isLoading,
      this.disableShadow,
      this.iconPath,
      this.iconSize,
      this.iconColor,
      this.loadingColor,
      this.textStyle,
      this.widget,
      this.animationDuration,
      this.disableAnimation,
      this.withoutPadding})
      : super(key: key);

  @required
  final Function onTap;
  final String text;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool? isLoading;
  final bool? disableShadow;
  final String? iconPath;
  final double? iconSize;
  final Color? iconColor;
  final Color? loadingColor;
  final TextStyle? textStyle;
  final Widget? widget;
  final Duration? animationDuration;
  final bool? disableAnimation;
  final bool? withoutPadding;

  @override
  Widget build(BuildContext context) {
    Widget button = Container(
      height: height ?? 58.h,
      width: width,
      padding: EdgeInsets.symmetric(vertical: withoutPadding == true ? 0 : 4.h),
      decoration: BoxDecoration(
        gradient: backgroundColor == null
            ? gradient ?? MainColors.primaryGradientColor
            : null,
        color: backgroundColor,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1.5,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(1000.r),
        boxShadow: disableShadow != true
            ? [
                BoxShadow(
                  color: (MainColors.blackColor.withOpacity(0.3)),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 3.h), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: MainColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000.r)),
          backgroundColor: MainColors.transparentColor,
          padding:
              EdgeInsets.symmetric(vertical: withoutPadding == true ? 0 : 10.h),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap();
        },
        child: widget ??
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading == true)
                  LoadingComponent(
                    color: loadingColor ?? MainColors.whiteColor,
                  ),
                if (isLoading == false || isLoading == null)
                  Expanded(
                    child: Center(
                        child: Row(
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconPath != null)
                          SvgPicture.asset(
                            iconPath!,
                            width: iconSize ?? 25.r,
                            color: iconColor ?? MainColors.textColor(context),
                          ),
                        if (iconPath != null && text != '')
                          SizedBox(width: 6.w),
                        if (text != '')
                          Text(
                            text,
                            style: textStyle ??
                                TextStyles.buttonTextStyle(context).copyWith(
                                  color: textColor ?? MainColors.whiteColor,
                                ),
                          ),
                      ],
                    )),
                  ),
              ],
            ),
      ),
    );

    return disableAnimation != true
        ? AnimatorComponent(
            time: animationDuration ?? const Duration(milliseconds: 0),
            child: button,
          )
        : button;
  }
}
