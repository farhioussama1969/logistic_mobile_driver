import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/animations_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:lottie/lottie.dart';

class GanderSelectorWindowComponent extends StatelessWidget {
  const GanderSelectorWindowComponent({super.key, required this.selectedGander, required this.onSelectGander});

  final GanderType? selectedGander;
  final Function(GanderType gander) onSelectGander;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30.r)),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    StringsAssetsConstants.selectGander,
                    style: TextStyles.mediumLabelTextStyle(context),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: AnimatedTypeTextComponent(
                    text: StringsAssetsConstants.selectGanderDescription,
                    textStyle: TextStyles.mediumBodyTextStyle(context).copyWith(
                      color: MainColors.textColor(context)!.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => onSelectGander(GanderType.male),
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: selectedGander == GanderType.male ? 150.r : 140.r,
                            width: selectedGander == GanderType.male ? 150.r : 140.r,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: selectedGander == GanderType.male ? MainColors.primaryColor : MainColors.backgroundColor(context),
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: MainColors.shadowColor(context)!.withOpacity(0.4),
                                  blurRadius: 10.r,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Lottie.asset(AnimationsAssetsConstants.maleAnimation),
                            ),
                          ),
                          if (selectedGander == GanderType.male)
                            AnimatedPositionedDirectional(
                              bottom: 0,
                              end: 0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                height: 20.r,
                                width: 20.r,
                                decoration: BoxDecoration(
                                  color: (MainColors.primaryColor),
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
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () => onSelectGander(GanderType.female),
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: selectedGander == GanderType.female ? 150.r : 140.r,
                            width: selectedGander == GanderType.female ? 150.r : 140.r,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: selectedGander == GanderType.female ? MainColors.primaryColor : MainColors.backgroundColor(context),
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: MainColors.shadowColor(context)!.withOpacity(0.4),
                                  blurRadius: 10.r,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Lottie.asset(AnimationsAssetsConstants.femaleAnimation),
                            ),
                          ),
                          if (selectedGander == GanderType.female)
                            AnimatedPositionedDirectional(
                              bottom: 0,
                              end: 0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                height: 20.r,
                                width: 20.r,
                                decoration: BoxDecoration(
                                  color: (MainColors.primaryColor),
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
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 20.h),
                  child: PrimaryButtonComponent(
                    onTap: () => Get.back(),
                    text: StringsAssetsConstants.done,
                  ),
                ),
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

enum GanderType { male, female }
