import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import '../../constants/icons_assets_constants.dart';

class ActionSliderComponent extends StatelessWidget {
  const ActionSliderComponent({super.key, required this.text, required this.controller, required this.onSwipe, this.toggleColor});

  final String text;
  final ActionSliderController controller;
  final Function onSwipe;
  final Color? toggleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ActionSlider.standard(
        height: 65,
        sliderBehavior: SliderBehavior.stretch,
        width: double.infinity,
        backgroundColor: MainColors.inputColor(context),
        icon: SvgPicture.asset(
          IconsAssetsConstants.arrowRightIcon,
          color: MainColors.whiteColor,
          width: 30.sp,
        ),
        toggleColor: toggleColor ?? MainColors.primaryColor,
        successIcon: SvgPicture.asset(
          IconsAssetsConstants.checkIcon,
          color: MainColors.whiteColor,
          width: 22.sp,
        ),
        failureIcon: SvgPicture.asset(
          IconsAssetsConstants.closeIcon,
          color: MainColors.whiteColor,
          width: 22.sp,
        ),
        loadingIcon: LoadingAnimationWidget.flickr(rightDotColor: MainColors.whiteColor, leftDotColor: MainColors.secondColor, size: 22.r),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: MainColors.shadowColor(context)!,
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
        controller: controller,
        action: (controller) => onSwipe(),
        child: Text(
          text,
          style: TextStyles.mediumBodyTextStyle(context).copyWith(
            color: MainColors.textColor(context)!.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
