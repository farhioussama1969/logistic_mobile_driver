import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/buttons/action_slider_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/data/models/order_model.dart';

class PaymentWindowComponent extends StatelessWidget {
  const PaymentWindowComponent(
      {super.key,
      required this.selectedRatingChange,
      required this.selectedPaymentSide,
      required this.onConfirm,
      required this.isLoading,
      required this.orderData,
      this.isOrderPriceChecked,
      this.isDeliveryPriceChecked,
      required this.orderPriceChecked,
      required this.deliveryPriceChecked,
      required this.actionSliderController});

  final OrderModel? orderData;
  final String? selectedPaymentSide;
  final Function(String) selectedRatingChange;
  final bool? isOrderPriceChecked;
  final bool? isDeliveryPriceChecked;

  final Function(bool value) orderPriceChecked;
  final Function(bool value) deliveryPriceChecked;

  final Function onConfirm;
  final bool isLoading;

  final ActionSliderController actionSliderController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Material(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  StringsAssetsConstants.orderCost,
                  style: TextStyles.mediumLabelTextStyle(context).copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    StringsAssetsConstants.specifyTheAmountPaid,
                    style: TextStyles.largeBodyTextStyle(context).copyWith(
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isOrderPriceChecked,
                        onChanged: (value) => orderPriceChecked(value!),
                        checkColor: MainColors.whiteColor,
                        activeColor: MainColors.successColor(context),
                      ),
                      Expanded(
                        child: Text(
                          StringsAssetsConstants.productPrice,
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        '${orderData?.price?.floor()} ${StringsAssetsConstants.currency}',
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isDeliveryPriceChecked,
                        onChanged: (value) => deliveryPriceChecked(value!),
                        checkColor: MainColors.whiteColor,
                        activeColor: MainColors.successColor(context),
                      ),
                      Expanded(
                        child: Text(
                          StringsAssetsConstants.deliveryPrice,
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      if (orderData?.coupon != null)
                        Text(
                          '${orderData?.deleveryCost?.floor() ?? 0} ${StringsAssetsConstants.currency}',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.errorColor(context),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      if (orderData?.coupon != null) SizedBox(width: 10.w),
                      if (orderData?.coupon != null)
                        Text(
                          '${orderData?.profitCost?.floor() ?? 0} ${StringsAssetsConstants.currency}',
                          style: TextStyles.largeBodyTextStyle(context).copyWith(
                            color: MainColors.successColor(context),
                          ),
                        ),
                      if (orderData?.coupon == null)
                        Text(
                          '${orderData?.deleveryCost?.floor() ?? 0} ${StringsAssetsConstants.currency}',
                          style: TextStyles.largeBodyTextStyle(context).copyWith(
                            color: MainColors.successColor(context),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 50.w),
                      Expanded(
                        child: Text(
                          StringsAssetsConstants.orderCost,
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        '${orderData?.totaleCost?.floor()} ${StringsAssetsConstants.currency}',
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Divider(
                    color: MainColors.disableColor(context)!.withOpacity(0.3),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            StringsAssetsConstants.procedures,
                            style: TextStyles.largeBodyTextStyle(context).copyWith(
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              StringsAssetsConstants.whoWasPay,
                              style: TextStyles.mediumBodyTextStyle(context),
                              maxLines: 2,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => selectedRatingChange('sender'),
                                child: TagComponent(
                                  title: StringsAssetsConstants.sender,
                                  backgroundColor:
                                      selectedPaymentSide == 'sender' ? MainColors.primaryColor : MainColors.inputColor(context),
                                  textColor: selectedPaymentSide == 'sender' ? MainColors.whiteColor : MainColors.textColor(context),
                                  disableShadow: true,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () => selectedRatingChange('reciver'),
                                child: TagComponent(
                                  title: StringsAssetsConstants.receiver,
                                  backgroundColor:
                                      selectedPaymentSide == 'reciver' ? MainColors.primaryColor : MainColors.inputColor(context),
                                  textColor: selectedPaymentSide == 'reciver' ? MainColors.whiteColor : MainColors.textColor(context),
                                  disableShadow: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 35.h),
                  ActionSliderComponent(
                    controller: actionSliderController,
                    text: StringsAssetsConstants.swipeText,
                    onSwipe: () => onConfirm(),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
