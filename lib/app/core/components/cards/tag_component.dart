import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class TagComponent extends StatelessWidget {
  const TagComponent(
      {Key? key,
      required this.title,
      this.iconPath,
      this.gradientBackgroundColor,
      this.backgroundColor,
      this.textColor,
      this.iconColor,
      this.disableShadow,
      this.textStyle,
      this.height,
      this.padding,
      this.iconWidth,
      this.border,
      this.borderRadius,
      this.flexibleHeight,
      this.titleWidget,
      this.width})
      : super(key: key);

  final String? title;
  final String? iconPath;
  final Gradient? gradientBackgroundColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final bool? disableShadow;
  final TextStyle? textStyle;
  final double? height;
  final EdgeInsets? padding;
  final double? iconWidth;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool? flexibleHeight;
  final Widget? titleWidget;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: flexibleHeight == true ? null : height ?? 35.h,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        gradient: backgroundColor != null ? null : gradientBackgroundColor ?? MainColors.primaryGradientColor,
        color: backgroundColor,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(1000.r),
        boxShadow: [
          if (disableShadow != true)
            BoxShadow(
              color: MainColors.shadowColor(context)!.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5.r,
              offset: const Offset(0, 0), // changes position of shadow
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            if (titleWidget == null)
              AnimatorComponent(
                time: const Duration(milliseconds: 100),
                child: SvgPicture.asset(
                  iconPath!,
                  width: iconWidth ?? 13.r,
                  color: iconColor ?? MainColors.whiteColor,
                ),
              ),
          if (iconPath != null)
            if (titleWidget == null) SizedBox(width: 5.r),
          if (titleWidget != null) titleWidget!,
          if (titleWidget == null)
            Flexible(
              child: Text(
                title ?? '',
                style: textStyle ??
                    TextStyles.smallBodyTextStyle(context).copyWith(
                      color: textColor ?? MainColors.whiteColor,
                    ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
        ],
      ),
    );
  }
}
