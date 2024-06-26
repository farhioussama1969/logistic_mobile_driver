import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/geolocator_location_service.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/create_new_order_steps_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/order_summary_window_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_1_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_2_component.dart';
import 'package:loogisti/app/modules/create_new_order/views/components/step_3_component.dart';

import '../controllers/create_new_order_controller.dart';

class CreateNewOrderView extends GetView<CreateNewOrderController> {
  const CreateNewOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.createNewOrder,
        onBack: () {
          if (controller.step == 1) {
            Get.back();
          } else {
            controller.setStep(controller.step - 1);
          }
        },
      ),
      body: ScrollableBodyComponent(
        children: [
          GetBuilder<CreateNewOrderController>(
              id: GetBuildersIdsConstants.createOrderSteps,
              builder: (logic) {
                return CreateNewOrderStepsComponent(
                  step: logic.step,
                );
              }),
          AnimatedSize(
            alignment: Alignment.topCenter,
            duration: const Duration(milliseconds: 300),
            child: GetBuilder<CreateNewOrderController>(
                id: GetBuildersIdsConstants.createOrderSteps,
                builder: (logic) {
                  return logic.step == 1
                      ? Step1Component(
                          getPricingLoading: controller.getPricingLoading,
                          fromKey: controller.step1FormKey,
                          pickUpLocationController: controller.pickUpLocationController,
                          dropOffLocationController: controller.dropOffLocationController,
                          pickUpLatitude: controller.pickUpLatitude,
                          pickUpLongitude: controller.pickUpLongitude,
                          dropOffLatitude: controller.dropOffLatitude,
                          dropOffLongitude: controller.dropOffLongitude,
                          onPickUpLocationSelected: (lat, lng) {
                            controller.pickUpLatitude = lat;
                            controller.pickUpLongitude = lng;
                            controller.changePrice(null);
                            controller.changeDistance(null);
                            controller.update([GetBuildersIdsConstants.createOrderSteps]);
                            if (controller.pickUpLatitude != null &&
                                controller.pickUpLongitude != null &&
                                controller.dropOffLatitude != null &&
                                controller.dropOffLongitude != null) {
                              controller.changeDistance(GeolocatorLocationService.calculateDistanceBetweenTwoPoints(
                                controller.pickUpLatitude!,
                                controller.pickUpLongitude!,
                                controller.dropOffLatitude!,
                                controller.dropOffLongitude!,
                              ));
                              controller.getDeliveryPrice();
                            }
                          },
                          onDropOffLocationSelected: (double? lat, double? lng) {
                            controller.dropOffLatitude = lat;
                            controller.dropOffLongitude = lng;
                            controller.changePrice(null);
                            controller.changeDistance(null);
                            controller.update([GetBuildersIdsConstants.createOrderSteps]);
                            if (controller.pickUpLatitude != null &&
                                controller.pickUpLongitude != null &&
                                controller.dropOffLatitude != null &&
                                controller.dropOffLongitude != null) {
                              controller.changeDistance(GeolocatorLocationService.calculateDistanceBetweenTwoPoints(
                                controller.pickUpLatitude!,
                                controller.pickUpLongitude!,
                                controller.dropOffLatitude!,
                                controller.dropOffLongitude!,
                              ));
                              controller.getDeliveryPrice();
                            }
                          },
                          distance: controller.distance,
                          price: controller.price,
                          senderPhoneNumberController: controller.senderPhoneNumberController,
                          receiverPhoneNumberController: controller.receiverPhoneNumberController,
                        )
                      : logic.step == 2
                          ? Step2Component(
                              formKey: controller.step2FormKey,
                              itemPriceController: controller.itemPriceController,
                              selectedInvoiceFile: controller.selectedInvoiceFile,
                              onFileSelected: controller.onFileSelected,
                            )
                          : Step3Component(
                              formKey: controller.step3FormKey,
                              pickupTimeController: controller.pickupTimeController,
                              pickupTime: controller.pickupTime,
                              onPickupTimeSelected: controller.onPickupTimeSelected,
                            );
                }),
          ),
          const Expanded(child: SizedBox.shrink()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 40.h,
            ),
            child: GetBuilder<CreateNewOrderController>(
              id: GetBuildersIdsConstants.createNewOrderButton,
              builder: (logic) {
                return PrimaryButtonComponent(
                  text: StringsAssetsConstants.next,
                  onTap: () => controller.nextStep(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showOrderSummaryWindow() {
    BottomSheetComponent.show(
      Get.context!,
      body: OrderSummaryWindowComponent(),
    );
  }
}
