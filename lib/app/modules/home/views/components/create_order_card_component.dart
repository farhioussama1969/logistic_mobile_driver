import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/logos_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class CreateOrderCardComponent extends StatelessWidget {
  const CreateOrderCardComponent({super.key, required this.count, required this.loading, this.progress, this.completed, this.canceled});

  final int? count;
  final int? progress;
  final int? completed;
  final int? canceled;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            gradient: MainColors.primaryGradientColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  LogosAssetsConstants.vectorLogo,
                  color: MainColors.whiteColor.withOpacity(0.1),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsAssetsConstants.orderIcon,
                            color: MainColors.whiteColor,
                            width: 24.r,
                          ),
                          SizedBox(width: 5.w),
                          if (count != null)
                            Text(
                              '${count ?? 0} ${StringsAssetsConstants.orders}',
                              style: TextStyles.mediumLabelTextStyle(context).copyWith(
                                color: MainColors.whiteColor,
                              ),
                            ),
                          if (count == null && loading)
                            LoadingAnimationWidget.staggeredDotsWave(
                              color: MainColors.whiteColor,
                              size: 30.r,
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
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: MainColors.warningColor(context),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            LogosAssetsConstants.vectorLogo,
                            color: MainColors.whiteColor.withOpacity(0.1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconsAssetsConstants.orderIcon,
                                      color: MainColors.whiteColor,
                                      width: 24.r,
                                    ),
                                    SizedBox(width: 5.w),
                                    if (progress != null)
                                      Center(
                                        child: Text(
                                          '${progress ?? 0} ${StringsAssetsConstants.progress}',
                                          style: TextStyles.mediumLabelTextStyle(context).copyWith(
                                            color: MainColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    if (progress == null && loading)
                                      LoadingAnimationWidget.staggeredDotsWave(
                                        color: MainColors.whiteColor,
                                        size: 30.r,
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
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: MainColors.successColor(context),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                LogosAssetsConstants.vectorLogo,
                                color: MainColors.whiteColor.withOpacity(0.1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconsAssetsConstants.orderIcon,
                                          color: MainColors.whiteColor,
                                          width: 24.r,
                                        ),
                                        SizedBox(width: 5.w),
                                        if (completed != null)
                                          Text(
                                            '${completed ?? 0} ${StringsAssetsConstants.completed}',
                                            style: TextStyles.mediumLabelTextStyle(context).copyWith(
                                              color: MainColors.whiteColor,
                                            ),
                                          ),
                                        if (completed == null && loading)
                                          LoadingAnimationWidget.staggeredDotsWave(
                                            color: MainColors.whiteColor,
                                            size: 30.r,
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
                      SizedBox(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          color: MainColors.errorColor(context),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                LogosAssetsConstants.vectorLogo,
                                color: MainColors.whiteColor.withOpacity(0.1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconsAssetsConstants.orderIcon,
                                          color: MainColors.whiteColor,
                                          width: 24.r,
                                        ),
                                        SizedBox(width: 5.w),
                                        if (canceled != null)
                                          Text(
                                            '${canceled ?? 0} ${StringsAssetsConstants.canceled}',
                                            style: TextStyles.mediumLabelTextStyle(context).copyWith(
                                              color: MainColors.whiteColor,
                                            ),
                                          ),
                                        if (canceled == null && loading)
                                          LoadingAnimationWidget.staggeredDotsWave(
                                            color: MainColors.whiteColor,
                                            size: 30.r,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
