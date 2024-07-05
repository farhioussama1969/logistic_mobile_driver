import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math; // import this

import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/components/shimmers/order_shimmer_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/color_convertor_util.dart';
import 'package:loogisti/app/core/utils/relative_date_util.dart';
import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/routes/app_pages.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderCardComponent extends StatelessWidget {
  const OrderCardComponent({super.key, this.orderData, this.onAccept, this.onReject});

  final OrderModel? orderData;
  final Function? onAccept;
  final Function? onReject;

  @override
  Widget build(BuildContext context) {
    double? progress = orderData?.currentDistance == null ? 0 : (orderData!.currentDistance! / orderData!.distance!);

    return orderData != null
        ? GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ORDER_DETAILS, arguments: {'order': orderData});
            },
            child: Container(
              decoration: BoxDecoration(
                color: MainColors.backgroundColor(context),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: MainColors.shadowColor(context)!.withOpacity(0.5),
                    blurRadius: 6.r,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.w, end: 15.w, bottom: 0, top: 8.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${StringsAssetsConstants.orderNumber}: ',
                                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${orderData?.id ?? '/'}',
                                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                        color: MainColors.primaryColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              RelativeDateUtil.getRelativeDateSinceNow(
                                  relativeDateInUnix: DateTime.parse('${orderData?.createdAt}').millisecondsSinceEpoch),
                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                color: MainColors.textColor(context)!.withOpacity(0.6),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (orderData?.driverPhone != null)
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              TagComponent(
                                title: '${StringsAssetsConstants.driver}: ${orderData?.driverPhone ?? '/'}',
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.r),
                                  bottomLeft: Radius.circular(15.r),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsAssetsConstants.garage,
                                  style: TextStyles.smallBodyTextStyle(context).copyWith(
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                ),
                                SvgPicture.asset(
                                  IconsAssetsConstants.arrowDownIcon,
                                  width: 18.r,
                                  color: MainColors.textColor(context),
                                ),
                                SizedBox(height: 4.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  StringsAssetsConstants.recipient,
                                  style: TextStyles.smallBodyTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                ),
                                SvgPicture.asset(
                                  IconsAssetsConstants.arrowDownIcon,
                                  width: 18.r,
                                  color: MainColors.primaryColor,
                                ),
                                SizedBox(height: 4.h),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4.h, left: 8.w, right: 8.w, bottom: 10.h),
                                    child: LinearPercentIndicator(
                                      lineHeight: 15.r,
                                      percent: progress ?? 0,
                                      animateFromLastPercent: true,
                                      animation: true,
                                      barRadius: Radius.circular(1000.r),
                                      backgroundColor: MainColors.disableColor(context)!.withOpacity(0.25),
                                      progressColor:
                                          ColorConvertorUtil().stringColorCodeToColor(orderData?.pcolor) ?? MainColors.primaryColor,
                                      animationDuration: 300,
                                      restartAnimation: false,
                                      isRTL: Get.locale?.languageCode == 'ar',
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            PositionedDirectional(
                              end: progress == 0.5
                                  ? 0
                                  : progress > 0.5
                                      ? ((1 - progress) * (0.8.sw))
                                      : null,
                              start: progress == 0.5
                                  ? 0
                                  : progress < 0.5
                                      ? (progress * (0.8.sw))
                                      : null,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Get.locale?.languageCode != 'ar' ? Matrix4.rotationY(math.pi) : Matrix4.rotationY(0),
                                child: SvgPicture.asset(
                                  IconsAssetsConstants.trackIcon,
                                  width: 25.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              AnimatorComponent(
                                time: const Duration(milliseconds: 300),
                                child: Column(
                                  children: [
                                    // SvgPicture.asset(
                                    //   IconsAssetsConstants.pointIcon,
                                    //   width: 22.r,
                                    //   color: MainColors.textColor(context),
                                    // ),
                                    // SizedBox(
                                    //   height: 40.h,
                                    //   child: VerticalDivider(
                                    //     color: MainColors.textColor(context),
                                    //     thickness: 1.r,
                                    //     indent: 0.r,
                                    //     endIndent: 0.r,
                                    //   ),
                                    // ),
                                    SvgPicture.asset(
                                      IconsAssetsConstants.locationIcon,
                                      width: 18.r,
                                      color: MainColors.textColor(context),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                  child: Column(
                                children: [
                                  // Column(
                                  //   children: [
                                  //     Row(
                                  //       children: [
                                  //         Expanded(
                                  //           child: AnimatedTypeTextComponent(
                                  //             text: StringsAssetsConstants.pickUpLocation,
                                  //             textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                  //               color: MainColors.textColor(context)!.withOpacity(0.6),
                                  //             ),
                                  //             textAlign: TextAlign.start,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     Row(
                                  //       children: [
                                  //         Expanded(
                                  //           child: Text(
                                  //             'Cairo, Nasr City, 5th Settlement, 90th Street, Building 17, Apartment 17',
                                  //             style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                  //               fontFamily: FontsFamilyAssetsConstants.bold,
                                  //             ),
                                  //             maxLines: 1,
                                  //             overflow: TextOverflow.ellipsis,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(height: 15.h),
                                  Column(
                                    children: [
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: AnimatedTypeTextComponent(
                                      //           text: StringsAssetsConstants.deliveryLocation,
                                      //           textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                      //             color: MainColors.textColor(context)!.withOpacity(0.6),
                                      //           ),
                                      //           textAlign: TextAlign.start),
                                      //     ),
                                      //   ],
                                      // ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              orderData?.deliveryName ?? '/',
                                              style: TextStyles.smallBodyTextStyle(context).copyWith(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconsAssetsConstants.routeIcon,
                              width: 15.r,
                              color: MainColors.textColor(context),
                            ),
                            SizedBox(width: 5.w),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${StringsAssetsConstants.remainingDistance}: ',
                                    style: TextStyles.smallBodyTextStyle(context).copyWith(
                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '15 ${StringsAssetsConstants.km}',
                                    style: TextStyles.smallBodyTextStyle(context).copyWith(
                                      color: MainColors.primaryColor,
                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: MainColors.textColor(context)!.withOpacity(0.1),
                    endIndent: 20.w,
                    indent: 20.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${StringsAssetsConstants.itemPrice}:',
                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                color: MainColors.textColor(context)!.withOpacity(0.6),
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              '${orderData?.price?.floor() ?? '/'} ${StringsAssetsConstants.currency}',
                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                color: MainColors.primaryColor,
                                fontFamily: FontsFamilyAssetsConstants.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${StringsAssetsConstants.deliveryPrice}:',
                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                color: MainColors.textColor(context)!.withOpacity(0.6),
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              '${orderData?.deleveryCost?.floor() ?? '/'} ${StringsAssetsConstants.currency}',
                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                color: MainColors.primaryColor,
                                fontFamily: FontsFamilyAssetsConstants.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${StringsAssetsConstants.totalPrice}:',
                              style: TextStyles.smallLabelTextStyle(context),
                            ),
                            Text(
                              '${((orderData?.price ?? 0) + (orderData?.deleveryNewCost ?? 0)).floor()} ${StringsAssetsConstants.currency}',
                              style: TextStyles.smallLabelTextStyle(context).copyWith(
                                color: MainColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                  if (orderData?.acceptButton != null && orderData?.rejectButton != null)
                    Divider(
                      color: MainColors.textColor(context)!.withOpacity(0.1),
                      endIndent: 20.w,
                      indent: 20.w,
                    ),
                  if (orderData?.acceptButton != null && orderData?.rejectButton != null) SizedBox(height: 5.h),
                  if (orderData?.acceptButton != null && orderData?.rejectButton != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButtonComponent(
                          onTap: () {
                            if (onAccept != null) {
                              onAccept!();
                            }
                          },
                          text: StringsAssetsConstants.accept,
                          width: 100.w,
                          height: 40.h,
                          backgroundColor: MainColors.successColor(context)!.withOpacity(0.2),
                          textColor: MainColors.successColor(context),
                          borderColor: MainColors.successColor(context),
                          disableShadow: true,
                          withoutPadding: true,
                          isLoading: orderData?.acceptingLoading,
                        ),
                        SizedBox(width: 20.w),
                        PrimaryButtonComponent(
                          onTap: () {
                            if (onReject != null) {
                              onReject!();
                            }
                          },
                          text: StringsAssetsConstants.reject,
                          width: 100.w,
                          height: 40.h,
                          backgroundColor: MainColors.errorColor(context)!.withOpacity(0.2),
                          textColor: MainColors.errorColor(context),
                          borderColor: MainColors.errorColor(context),
                          disableShadow: true,
                          withoutPadding: true,
                          isLoading: orderData?.rejectingLoading,
                        ),
                      ],
                    ),
                  if (orderData?.acceptButton != null && orderData?.rejectButton != null) SizedBox(height: 15.h),
                ],
              ),
            ),
          )
        : const OrderShimmerComponent();
  }
}
