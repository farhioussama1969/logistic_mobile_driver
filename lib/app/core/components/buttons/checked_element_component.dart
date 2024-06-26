import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class CheckedElementComponent extends StatelessWidget {
  const CheckedElementComponent(
      {Key? key, required this.title, required this.isChecked, this.isExpanded, this.onTap, this.hideCheckedIcon, this.padding, this.color})
      : super(key: key);

  final String title;
  final bool isChecked;
  final bool? isExpanded;
  final Function? onTap;
  final bool? hideCheckedIcon;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Stack(
        children: [
          AnimatedContainer(
            width: isExpanded == true ? double.infinity : null,
            margin: EdgeInsets.all(4.r),
            duration: const Duration(milliseconds: 300),
            padding: padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: (isChecked) ? (color ?? MainColors.primaryColor) : MainColors.backgroundColor(context),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: (isChecked) ? (color ?? MainColors.primaryColor) : MainColors.disableColor(context)!.withOpacity(0.1),
                width: 1.5.r,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                    color: (isChecked) ? MainColors.whiteColor : MainColors.textColor(context),
                  ),
                ),
              ],
            ),
          ),
          if (isChecked && hideCheckedIcon != true)
            AnimatedPositionedDirectional(
              bottom: 0,
              end: 0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                height: 20.r,
                width: 20.r,
                decoration: BoxDecoration(
                  color: (color ?? MainColors.primaryColor),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MainColors.backgroundColor(context)!,
                    width: 1.5.r,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconsAssetsConstants.checkIcon,
                    color: MainColors.whiteColor,
                    width: 10.r,
                  ),
                ),
              ),
            )
        ],
      ),
    )
        .animate(delay: (100).ms)
        .fadeIn(duration: 900.ms, delay: 50.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.1))
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
    ;
  }
}
