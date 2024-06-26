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
        Get.find<HomeController>().refreshHome();
        Get.back();
        ToastComponent.showSuccessToast(Get.context!, text: StringsAssetsConstants.orderStatusHasBeenUpdatedSuccessfully);
      }
    });
  }

  bool orderCommentLoading = false;
  void orderCommentLoadingChange(bool value) {
    orderCommentLoading = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  int? selectedRating;
  void selectedRatingChange(int value) {
    selectedRating = value;
    update([GetBuildersIdsConstants.orderRating]);
  }

  final TextEditingController commentController = TextEditingController();

  Future<void> orderComment() async {
    if (orderCommentLoading) return;
    await OrderProvider()
        .orderRating(
      orderId: orderData?.id,
      comment: commentController.text,
      rating: selectedRating,
      onLoading: () => orderCommentLoadingChange(true),
      onFinal: () => orderCommentLoadingChange(false),
    )
        .then((value) {
      if (value != null) {
        Get.find<HomeController>().refreshHome();
        Get.back();
        Get.back();
      }
    });
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      orderData = Get.arguments['order'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    // const OrderDetailsView().showRatingWindow();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
