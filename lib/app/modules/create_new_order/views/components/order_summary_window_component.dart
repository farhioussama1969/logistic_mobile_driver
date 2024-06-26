import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/debouncer_util.dart';
import 'package:loogisti/app/modules/create_new_order/controllers/create_new_order_controller.dart';

import '../../../../core/components/buttons/icon_button_component.dart';

class OrderSummaryWindowComponent extends StatelessWidget {
  const OrderSummaryWindowComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<CreateNewOrderController>(
            id: GetBuildersIdsConstants.createNewOrderSummary,
            builder: (logic) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: MainColors.backgroundColor(context),
                  borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30.r)),
                ),
                child: ScrollableBodyComponent(
                  children: [
                    Center(
                      child: Text(
                        StringsAssetsConstants.orderSummary,
                        style: TextStyles.mediumLabelTextStyle(context),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: MainColors.backgroundColor(context),
                        border: Border.all(
                          color: MainColors.inputColor(context)!,
                          width: 1.r,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '${StringsAssetsConstants.senderPhoneNumber}: ',
                                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                  color: MainColors.textColor(context)!.withOpacity(0.6),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  logic.senderPhoneNumberController.text,
                                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: 50.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                '${StringsAssetsConstants.receiverPhoneNumber}: ',
                                style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                  color: MainColors.textColor(context)!.withOpacity(0.6),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  logic.receiverPhoneNumberController.text,
                                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: 100.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 8.h),
                          Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              AnimatorComponent(
                                time: const Duration(milliseconds: 300),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      IconsAssetsConstants.pointIcon,
                                      width: 22.r,
                                      color: MainColors.textColor(context),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                      child: VerticalDivider(
                                        color: MainColors.textColor(context),
                                        thickness: 1.r,
                                        indent: 0.r,
                                        endIndent: 0.r,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      IconsAssetsConstants.locationIcon,
                                      width: 22.r,
                                      color: MainColors.textColor(context),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                  child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AnimatedTypeTextComponent(
                                              text: StringsAssetsConstants.pickUpLocation,
                                              textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                                color: MainColors.textColor(context)!.withOpacity(0.6),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              logic.pickUpLocationController.text,
                                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                                fontFamily: FontsFamilyAssetsConstants.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AnimatedTypeTextComponent(
                                                text: StringsAssetsConstants.deliveryLocation,
                                                textStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                                                  color: MainColors.textColor(context)!.withOpacity(0.6),
                                                ),
                                                textAlign: TextAlign.start),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              logic.dropOffLocationController.text,
                                              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                                fontFamily: FontsFamilyAssetsConstants.bold,
                                              ),
                                              maxLines: 1,
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
                          SizedBox(height: 8.h),
                          Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                          SizedBox(height: 8.h),
                          if (logic.isChosenTime)
                            Row(
                              children: [
                                Text(
                                  '${StringsAssetsConstants.preferredPickupTime}: ',
                                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                    color: MainColors.textColor(context)!.withOpacity(0.6),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    logic.pickupTime.toString().substring(10, 16),
                                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                      color: MainColors.primaryColor,
                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            )
                                .animate(delay: 300.ms)
                                .fadeIn(duration: 900.ms, delay: 300.ms)
                                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          if (logic.isChosenTime) SizedBox(height: 8.h),
                          if (logic.isChosenTime) Divider(color: MainColors.textColor(context)!.withOpacity(0.1)),
                          if (logic.isChosenTime) SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                '${StringsAssetsConstants.itemPrice}: ',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                              Expanded(
                                child: Text(
                                  '${logic.itemPriceController.text} ${StringsAssetsConstants.currency}',
                                  style: TextStyles.largeBodyTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: 400.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                '${StringsAssetsConstants.deliveryPrice}: ',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                              Expanded(
                                child: Text(
                                  '${logic.price?.floor()} ${StringsAssetsConstants.currency}',
                                  style: TextStyles.largeBodyTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: 500.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          if (logic.discountPercentage != null) SizedBox(height: 10.h),
                          if (logic.discountPercentage != null)
                            Row(
                              children: [
                                Text(
                                  '${StringsAssetsConstants.discount}: (${logic.couponCode})',
                                  style: TextStyles.largeBodyTextStyle(context),
                                ),
                                Expanded(
                                  child: Text(
                                    '-${(((logic.price ?? 0) * (logic.discountPercentage ?? 0)) / 100).floor()} ${StringsAssetsConstants.currency}',
                                    style: TextStyles.largeBodyTextStyle(context).copyWith(
                                      color: MainColors.errorColor(context),
                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            )
                                .animate(delay: 500.ms)
                                .fadeIn(duration: 900.ms, delay: 300.ms)
                                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                '${StringsAssetsConstants.totalPrice}: ',
                                style: TextStyles.mediumLabelTextStyle(context),
                              ),
                              Expanded(
                                child: Text(
                                  '${(logic.discountPercentage == null) ? ((double.parse(logic.itemPriceController.text) + (logic.price ?? 0)).floor()) : ((double.parse(logic.itemPriceController.text) + (logic.price ?? 0)) - (((logic.price ?? 0) * (logic.discountPercentage ?? 0)) / 100)).floor()} ${StringsAssetsConstants.currency}',
                                  style: TextStyles.mediumLabelTextStyle(context).copyWith(
                                    color: MainColors.primaryColor,
                                    fontFamily: FontsFamilyAssetsConstants.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          )
                              .animate(delay: 600.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              StringsAssetsConstants.enterCouponCode,
                              style: TextStyles.largeBodyTextStyle(context),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Divider(
                                  color: MainColors.textColor(context)!.withOpacity(0.1),
                                ),
                              ),
                            ),
                            if (logic.discountPercentage != null)
                              Row(
                                children: [
                                  Text(
                                    '${logic.discountPercentage?.floor()}%',
                                    style: TextStyles.largeBodyTextStyle(context).copyWith(
                                      color: MainColors.primaryColor,
                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  IconButtonComponent(
                                    onTap: () {},
                                    iconLink: IconsAssetsConstants.discountIcon,
                                    buttonWidth: 30.r,
                                    buttonHeight: 30.r,
                                    iconWidth: 18.r,
                                    iconHeight: 18.r,
                                    border: Border.all(
                                      color: MainColors.textColor(context)!.withOpacity(0.1),
                                      width: 1.r,
                                    ),
                                    backgroundColor: MainColors.inputColor(context),
                                    iconColor: MainColors.primaryColor,
                                  ),
                                ],
                              )
                                  .animate(delay: 300.ms)
                                  .fadeIn(duration: 900.ms, delay: 300.ms)
                                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                  .move(begin: const Offset(100, 0), curve: Curves.easeOutQuad),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        TextInputComponent(
                          hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.couponCode}...',
                          suffix: Row(
                            children: [
                              SizedBox(width: 10.w),
                              if (logic.checkCouponLoading) const LoadingComponent(),
                              if (!logic.checkCouponLoading && logic.isCouponValid == false)
                                SvgPicture.asset(
                                  IconsAssetsConstants.errorCircleIcon,
                                  width: 25.r,
                                  color: MainColors.errorColor(context),
                                ),
                              if (!logic.checkCouponLoading && logic.isCouponValid == true)
                                SvgPicture.asset(
                                  IconsAssetsConstants.checkedIcon,
                                  width: 25.r,
                                  color: MainColors.successColor(context),
                                ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                          onChange: (value) => DebouncerUtil.debounce(() => logic.checkCoupon(value)),
                          prefix: Row(
                            children: [
                              SizedBox(width: 20.w),
                              SvgPicture.asset(IconsAssetsConstants.couponIcon, width: 25.r, color: MainColors.textColor(context)),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    SizedBox(height: 15.h),
                    PrimaryButtonComponent(
                      onTap: () => logic.createNewOrder(),
                      text: StringsAssetsConstants.confirm,
                      isLoading: logic.createNewOrderLoading,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            }),
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
