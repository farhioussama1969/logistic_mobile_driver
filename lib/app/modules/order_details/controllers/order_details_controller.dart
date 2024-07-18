import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/order_provider.dart';
import 'package:loogisti/app/modules/home/controllers/home_controller.dart';
import 'package:loogisti/app/modules/order_details/views/order_details_view.dart';

class OrderDetailsController extends GetxController {
  OrderModel? orderData;

  Future<void> changeOrderStatus(int componentIndex) async {
    if (orderData?.orderComponent?.buttons?[componentIndex].isLoading == true) return;
    await OrderProvider()
        .orderAction(
            orderId: orderData?.id,
            statusId: orderData?.orderComponent?.buttons?[componentIndex].statusId,
            onLoading: () {
              orderData?.orderComponent?.buttons?[componentIndex].isLoading = true;
              update();
            },
            onFinal: () {
              orderData?.orderComponent?.buttons?[componentIndex].isLoading = false;
              update();
            })
        .then((value) {
      if (value != null) {
        refreshOrder();
        ToastComponent.showSuccessToast(Get.context!, text: StringsAssetsConstants.orderStatusHasBeenUpdatedSuccessfully);
      }
    });
  }

  bool orderPaymentLoading = false;
  void changeOrderPaymentLoading(bool value) {
    orderPaymentLoading = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  String? selectedWhoPayed = 'sender';
  void changeSelectedHwoPayed(String value) {
    selectedWhoPayed = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  bool orderPriceChecked = false;
  void changeOrderPriceChecked(bool value) {
    orderPriceChecked = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  bool deliveryPriceChecked = false;
  void changeDeliveryPriceChecked(bool value) {
    deliveryPriceChecked = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  Future<void> orderComment() async {
    if (orderPaymentLoading) return;
    await OrderProvider()
        .orderPayment(
      type: (orderPriceChecked && deliveryPriceChecked)
          ? 3
          : (orderPriceChecked && !deliveryPriceChecked)
              ? 1
              : 2,
      orderId: orderData?.id,
      person: selectedWhoPayed,
      onLoading: () {
        changeOrderPaymentLoading(true);
        actionSliderController.loading();
      },
      onFinal: () {
        changeOrderPaymentLoading(false);
      },
    )
        .then((value) async {
      if (value != null) {
        actionSliderController.success();
        Get.find<HomeController>().refreshHome();
        Get.back();
        Get.back();
      } else {
        actionSliderController.failure();
        await Future.delayed(Duration(seconds: 2));
        actionSliderController.reset();
      }
    });
  }

  bool refreshOrderLoading = false;

  void changeRefreshOrderLoading(bool value) {
    refreshOrderLoading = value;
    update([GetBuildersIdsConstants.orderDetails]);
  }

  Future<void> refreshOrder() async {
    await OrderProvider()
        .getOrderDetails(
      orderId: orderData?.id,
      onLoading: () => changeRefreshOrderLoading(true),
      onFinal: () => changeRefreshOrderLoading(false),
    )
        .then((value) {
      if (value != null) {
        orderData = value;
        update([GetBuildersIdsConstants.orderDetails]);
        if (orderData?.action == 'pay') {
          const OrderDetailsView().showPaymentWindow();
        }
      }
    });
  }

  final ActionSliderController actionSliderController = ActionSliderController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      orderData = Get.arguments['order'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    if (orderData?.action == 'pay') {
      const OrderDetailsView().showPaymentWindow();
    }
    if (Get.arguments['refresh'] == true) {
      refreshOrder();
    }
    //const OrderDetailsView().showRatingWindow();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
