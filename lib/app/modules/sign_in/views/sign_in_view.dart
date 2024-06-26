import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animated_possition_component.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/logos_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/theme_util.dart';
import 'package:loogisti/app/modules/sign_in/views/components/social_login_button_component.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: SvgPicture.asset(
              ImagesAssetsConstants.signInBackground1Image,
            ).animate(delay: 100.ms).fadeIn(duration: 900.ms, delay: 300.ms).move(begin: const Offset(0, -16), curve: Curves.easeOutQuad),
          ),
          PositionedDirectional(
            bottom: 50.h,
            start: 0,
            end: 0,
            child: AnimatedPositionComponent(
              duration: const Duration(seconds: 3),
              beginOffset: Offset(0, 0.2.h),
              endOffset: Offset(0, 0.1.h),
              child: SvgPicture.asset(
                ImagesAssetsConstants.signInBackground2Image,
              ).animate(delay: 100.ms).fadeIn(duration: 900.ms, delay: 300.ms).move(begin: const Offset(16, 0), curve: Curves.easeOutQuad),
            ),
          ),
          PositionedDirectional(
            bottom: 220.h,
            start: 0,
            end: 0,
            child: AnimatedPositionComponent(
              duration: const Duration(seconds: 6),
              beginOffset: Offset(-0.2.w, 0),
              endOffset: const Offset(0, 0),
              child: SvgPicture.asset(
                ImagesAssetsConstants.signInBackground3Image,
                color: MainColors.primaryColor.withOpacity(0.5),
                width: 100.r,
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 195.h,
            start: 0,
            end: 0,
            child: AnimatedPositionComponent(
              duration: const Duration(seconds: 10),
              beginOffset: Offset(-0.2.w, 0),
              endOffset: const Offset(0, 0),
              child: SvgPicture.asset(
                ImagesAssetsConstants.signInBackground3Image,
                color: MainColors.primaryColor.withOpacity(0.5),
                width: 50.r,
              ),
            ),
          ),
          SizedBox(
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: SvgPicture.asset(
                      ThemeUtil.isDarkMode ? LogosAssetsConstants.fullHorizontalLogoWhite : LogosAssetsConstants.fullHorizontalLogoBlack,
                      width: 300.r,
                    ),
                  )
                      .animate(delay: 100.ms)
                      .fadeIn(duration: 900.ms, delay: 300.ms)
                      .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                      .move(begin: const Offset(0, -16), curve: Curves.easeOutQuad),
                  const Expanded(flex: 1, child: SizedBox.shrink()),
                  Column(
                    children: [
                      Center(
                        child: AnimatorComponent(
                          time: const Duration(milliseconds: 300),
                          child: Text(
                            StringsAssetsConstants.welcome,
                            style: TextStyles.mediumLabelTextStyle(context),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: AnimatorComponent(
                          time: const Duration(milliseconds: 400),
                          child: Text(
                            StringsAssetsConstants.welcomeDescription,
                            style: TextStyles.largeBodyTextStyle(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(flex: 1, child: SizedBox.shrink()),
                  Column(
                    children: [
                      GetBuilder<SignInController>(
                              id: GetBuildersIdsConstants.signInGoogleButton,
                              builder: (logic) {
                                return SocialLoginButtonComponent(
                                  iconPath: IconsAssetsConstants.googleIcon,
                                  title: StringsAssetsConstants.signInWithGoogle,
                                  onTap: () => logic.signInWithGoogle(),
                                  isLoading: logic.googleSignInLoading,
                                );
                              })
                          .animate(delay: (1 * 200).ms)
                          .fadeIn(duration: 900.ms, delay: 300.ms)
                          .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                          .move(begin: const Offset(15, 0), curve: Curves.easeOutQuad),
                      SizedBox(height: 15.h),
                      if (Platform.isIOS)
                        SocialLoginButtonComponent(
                          iconPath: IconsAssetsConstants.appleIcon,
                          iconColor: MainColors.textColor(context),
                          title: StringsAssetsConstants.signInWithApple,
                          onTap: () {},
                          isLoading: false,
                        )
                            .animate(delay: (2 * 200).ms)
                            .fadeIn(duration: 900.ms, delay: 300.ms)
                            .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                            .move(begin: const Offset(-15, 0), curve: Curves.easeOutQuad),
                      SizedBox(height: 30.h),
                      AnimatorComponent(
                        time: const Duration(milliseconds: 500),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringsAssetsConstants.registerAsADriver,
                                style: TextStyles.largeBodyTextStyle(context).copyWith(
                                  fontFamily: FontsFamilyAssetsConstants.bold,
                                  color: MainColors.primaryColor,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              SvgPicture.asset(
                                Get.locale?.languageCode == 'en' ? IconsAssetsConstants.arrowRightIcon : IconsAssetsConstants.arrowLeftIcon,
                                width: 20.r,
                                color: MainColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(flex: 4, child: SizedBox.shrink()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
