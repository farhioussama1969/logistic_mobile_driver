import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/cards/order_card_component.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/pop_ups/dialog_component.dart';
import 'package:loogisti/app/core/components/text/animated_type_text_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/url_launcher_service.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/color_convertor_util.dart';
import 'package:loogisti/app/modules/order_details/views/components/order_statuses_history_section_component.dart';
import 'package:loogisti/app/modules/order_details/views/components/payment_window_component.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.orderDetails,
      ),
      body: GetBuilder<OrderDetailsController>(
          id: GetBuildersIdsConstants.orderDetails,
          builder: (logic) {
            return !logic.refreshOrderLoading
                ? RefreshIndicator(
                    color: MainColors.primaryColor,
                    onRefresh: () async => Future.delayed(
                      Duration(seconds: 1),
                      () => logic.refreshOrder(),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            OrderCardComponent(
                              orderData: controller.orderData,
                            )
                                .animate(delay: 100.ms)
                                .fadeIn(duration: 900.ms, delay: 300.ms)
                                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                .move(begin: const Offset(0, -16), curve: Curves.easeOutQuad),
                            SizedBox(height: 30.h),
                            Row(
                              children: [
                                SizedBox(width: 10.w),
                                Text(
                                  StringsAssetsConstants.destinationPoint,
                                  style: TextStyles.mediumLabelTextStyle(context),
                                )
                              ],
                            )
                                .animate(delay: 200.ms)
                                .fadeIn(duration: 900.ms, delay: 300.ms)
                                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                              child: Row(
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
                                                child: GestureDetector(
                                                  onTap: () {
                                                    UrlLauncherService.openLink(
                                                        link:
                                                            'https://maps.google.com/?ll=${logic.orderData?.pickupLocationLate},${logic.orderData?.pickupLocationLong}');
                                                  },
                                                  child: Text(
                                                    controller.orderData?.puckUpName ?? '',
                                                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
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
                                                child: GestureDetector(
                                                  onTap: () {
                                                    UrlLauncherService.openLink(
                                                        link:
                                                            'https://maps.google.com/?ll=${logic.orderData?.deliveryLocationLate},${logic.orderData?.deliveryLocationLong}');
                                                  },
                                                  child: Text(
                                                    controller.orderData?.deliveryName ?? '',
                                                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                                      fontFamily: FontsFamilyAssetsConstants.bold,
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
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
                            )
                                .animate(delay: 300.ms)
                                .fadeIn(duration: 900.ms, delay: 300.ms)
                                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                            if (controller.orderData?.orderComponent != null)
                              GetBuilder<OrderDetailsController>(builder: (logic) {
                                return Column(
                                  children: [
                                    SizedBox(height: 30.h),
                                    Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(
                                          StringsAssetsConstants.procedures,
                                          style: TextStyles.mediumLabelTextStyle(context),
                                        )
                                      ],
                                    )
                                        .animate(delay: 200.ms)
                                        .fadeIn(duration: 900.ms, delay: 400.ms)
                                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                                    SizedBox(height: 15.h),
                                    Row(children: [
                                      Expanded(
                                        child: Text(
                                          controller.orderData?.orderComponent?.text ?? '',
                                          style: TextStyles.mediumBodyTextStyle(context),
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      for (int i = 0; i < (controller.orderData?.orderComponent?.buttons?.length ?? 0); i++)
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                                          child: InkWell(
                                            onTap: () {
                                              controller.changeOrderStatus(i);
                                            },
                                            child: TagComponent(
                                              title: '',
                                              backgroundColor: ColorConvertorUtil()
                                                  .stringColorCodeToColor(controller.orderData?.orderComponent?.buttons?[i].bgcolor),
                                              titleWidget: controller.orderData?.orderComponent?.buttons?[i].isLoading != true
                                                  ? Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 25.r,
                                                          height: 25.r,
                                                          child: NetworkImageComponent(
                                                            imageLink: '${controller.orderData?.orderComponent?.buttons?[i].icon}',
                                                            fit: BoxFit.contain,
                                                            loadingWidget: const SizedBox.shrink(),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5.w),
                                                        Text(
                                                          controller.orderData?.orderComponent?.buttons?[i].text ?? '',
                                                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                                            color: ColorConvertorUtil().stringColorCodeToColor(
                                                                controller.orderData?.orderComponent?.buttons?[i].color),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : const LoadingComponent(color: MainColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                    ]),
                                  ],
                                );
                              }),
                            if (controller.orderData?.status?.isNotEmpty ?? true) SizedBox(height: 30.h),
                            if (controller.orderData?.status?.isNotEmpty ?? true)
                              Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Text(
                                    StringsAssetsConstants.orderStatusesHistory,
                                    style: TextStyles.mediumLabelTextStyle(context),
                                  )
                                ],
                              )
                                  .animate(delay: 200.ms)
                                  .fadeIn(duration: 900.ms, delay: 400.ms)
                                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                            OrderStatusesHistorySectionComponent(
                              orderStatusData: controller.orderData?.status ?? [],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(child: LoadingComponent(color: MainColors.primaryColor));
          }),
    );
  }

  void showPaymentWindow() {
    DialogComponent().show(
      Get.context!,
      body: GetBuilder<OrderDetailsController>(
          id: GetBuildersIdsConstants.orderRating,
          autoRemove: false,
          builder: (logic) {
            return PaymentWindowComponent(
              onConfirm: logic.orderComment,
              isLoading: logic.orderPaymentLoading,
              selectedPaymentSide: logic.selectedWhoPayed,
              selectedRatingChange: logic.changeSelectedHwoPayed,
              orderData: logic.orderData,
              deliveryPriceChecked: logic.changeDeliveryPriceChecked,
              orderPriceChecked: logic.changeOrderPriceChecked,
              isDeliveryPriceChecked: logic.deliveryPriceChecked,
              isOrderPriceChecked: logic.orderPriceChecked,
              actionSliderController: logic.actionSliderController,
            );
          }),
    );
  }
}
