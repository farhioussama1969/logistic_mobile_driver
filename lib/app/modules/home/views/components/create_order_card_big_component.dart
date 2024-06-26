import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animated_possition_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/logos_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class CreateOrderCardBigComponent extends StatelessWidget {
  const CreateOrderCardBigComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: 300.h,
            decoration: BoxDecoration(
              color: MainColors.backgroundColor(context),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: MainColors.shadowColor(context)!.withOpacity(0.5),
                  blurRadius: 5.r,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SvgPicture.asset(
                          ImagesAssetsConstants.createNewOrderCardBackgroundImage,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      StringsAssetsConstants.createNewOrderDescription,
                                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                        color: MainColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                )
                                    .animate(delay: 150.ms)
                                    .fadeIn(duration: 900.ms, delay: 300.ms)
                                    .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      LogosAssetsConstants.smallLogo,
                                    )
                                        .animate(delay: 250.ms)
                                        .fadeIn(duration: 900.ms, delay: 300.ms)
                                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedPositionComponent(
                                  duration: const Duration(seconds: 3),
                                  beginOffset: Offset(0, 0.1.h),
                                  endOffset: Offset(0, 0.h),
                                  child: SvgPicture.asset(
                                    ImagesAssetsConstants.createNewOrderCardTrackImage,
                                    width: 150.r,
                                  )
                                      .animate(delay: 350.ms)
                                      .fadeIn(duration: 900.ms, delay: 300.ms)
                                      .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                                ),
                                PrimaryButtonComponent(
                                  height: 50.h,
                                  width: 150.w,
                                  onTap: () => Get.toNamed(Routes.CREATE_NEW_ORDER),
                                  textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                    color: MainColors.whiteColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                  text: StringsAssetsConstants.createNewOrder,
                                  iconPath: IconsAssetsConstants.addIcon,
                                  iconColor: MainColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 50.ms)
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad);
  }
}
