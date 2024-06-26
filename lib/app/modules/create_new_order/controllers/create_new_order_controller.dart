import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/toast_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/data/providers/loogistic_api/order_provider.dart';
import 'package:loogisti/app/modules/create_new_order/views/create_new_order_view.dart';
import 'package:loogisti/app/modules/home/controllers/home_controller.dart';

class CreateNewOrderController extends GetxController {
  final GlobalKey<FormState> step1FormKey = GlobalKey<FormState>();

  final TextEditingController pickUpLocationController = TextEditingController();
  final TextEditingController dropOffLocationController = TextEditingController();

  double? pickUpLatitude;
  double? pickUpLongitude;

  double? dropOffLatitude;
  double? dropOffLongitude;

  int step = 1;
  void setStep(int value) {
    step = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  final TextEditingController senderPhoneNumberController = TextEditingController();
  final TextEditingController receiverPhoneNumberController = TextEditingController();

  bool getPricingLoading = false;
  void changePricingLoading(bool value) {
    getPricingLoading = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  double? price;
  void changePrice(double? value) {
    price = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  double? distance;
  void changeDistance(double? value) {
    distance = value;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  void getDeliveryPrice() {
    if (getPricingLoading) return;
    OrderProvider()
        .getDeliveryPricing(
      pickupLocationLong: pickUpLongitude!,
      pickupLocationLate: pickUpLatitude!,
      deliveryLocationLong: dropOffLongitude!,
      deliveryLocationLate: dropOffLatitude!,
      onLoading: () {
        changePricingLoading(true);
      },
      onFinal: () {
        changePricingLoading(false);
      },
    )
        .then((value) {
      if (value != null) {
        changePrice(value);
      }
    });
  }

  //step 02

  final GlobalKey<FormState> step2FormKey = GlobalKey<FormState>();

  final TextEditingController itemPriceController = TextEditingController();

  File? selectedInvoiceFile;
  void onFileSelected(File? file) {
    selectedInvoiceFile = file;
    update([GetBuildersIdsConstants.createOrderStep2]);
  }

  //step 03

  final GlobalKey<FormState> step3FormKey = GlobalKey<FormState>();

  final TextEditingController pickupTimeController = TextEditingController();

  bool isChosenTime = false;
  void changeChosenTime(bool value) {
    isChosenTime = value;
    update([GetBuildersIdsConstants.createOrderStep3]);
  }

  DateTime? pickupTime;
  void onPickupTimeSelected(DateTime time) {
    pickupTimeController.text = time.toString().substring(10, 16);
    pickupTime = time;
    update([GetBuildersIdsConstants.createOrderSteps]);
  }

  double? discountPercentage;
  void changeDiscountPercentage(double? value) {
    discountPercentage = value;
    update([GetBuildersIdsConstants.createNewOrderSummary]);
  }

  bool checkCouponLoading = false;
  void changeCheckCouponLoading(bool value) {
    checkCouponLoading = value;
    update([GetBuildersIdsConstants.createNewOrderSummary]);
  }

  bool? isCouponValid;
  void changeIsCouponValid(bool? value) {
    isCouponValid = value;
    update([GetBuildersIdsConstants.createNewOrderSummary]);
  }

  String? couponCode;

  void checkCoupon(String couponCode) async {
    changeDiscountPercentage(null);
    if (checkCouponLoading) return;
    await OrderProvider()
        .couponValidate(
      couponCode: couponCode,
      onLoading: () => changeCheckCouponLoading(true),
      onFinal: () => changeCheckCouponLoading(false),
    )
        .then((coupon) {
      if (coupon != null) {
        changeDiscountPercentage(coupon);
        changeIsCouponValid(true);
        this.couponCode = couponCode;
        Future.delayed(const Duration(milliseconds: 500), () => changeIsCouponValid(null));
      } else {
        if (couponCode.isNotEmpty) {
          changeIsCouponValid(false);
          Future.delayed(const Duration(milliseconds: 1000), () => changeIsCouponValid(null));
        } else {
          changeIsCouponValid(null);
        }
      }
    });
  }

  void nextStep() {
    if (step == 1) {
      if (step1FormKey.currentState!.validate()) {
        setStep(2);
      }
    } else if (step == 2) {
      if (step2FormKey.currentState!.validate()) {
        if (selectedInvoiceFile != null) {
          setStep(3);
        } else {
          ToastComponent.showErrorToast(Get.context!, text: '${StringsAssetsConstants.check} ${StringsAssetsConstants.itemInvoice}');
        }
      }
    } else if (step == 3) {
      if (isChosenTime) {
        if (step3FormKey.currentState!.validate()) {
          const CreateNewOrderView().showOrderSummaryWindow();
        }
      } else {
        const CreateNewOrderView().showOrderSummaryWindow();
      }
    }
  }

  bool createNewOrderLoading = false;
  void changeCreateNewOrderLoading(bool value) {
    createNewOrderLoading = value;
    update([GetBuildersIdsConstants.createNewOrderSummary]);
  }

  void createNewOrder() {
    if (createNewOrderLoading) return;
    OrderProvider()
        .createNewOrder(
      pickupName: pickUpLocationController.text,
      pickupLocationLong: pickUpLongitude!,
      pickupLocationLate: pickUpLatitude!,
      deliveryName: dropOffLocationController.text,
      deliveryLocationLong: dropOffLongitude!,
      deliveryLocationLate: dropOffLatitude!,
      distance: distance!,
      deliveryCost: price!,
      senderPhone: senderPhoneNumberController.text,
      reciverPhone: receiverPhoneNumberController.text,
      price: double.parse(itemPriceController.text),
      bestTimeDelevery: isChosenTime ? pickupTime.toString().substring(10, 15) : null,
      coupon: couponCode,
      image: selectedInvoiceFile,
      onLoading: () => changeCreateNewOrderLoading(true),
      onFinal: () => changeCreateNewOrderLoading(false),
    )
        .then((value) {
      if (value != null) {
        Get.back();
        Get.back();
        Get.find<HomeController>().refreshHome();
        ToastComponent.showSuccessToast(Get.context!, text: StringsAssetsConstants.createOrderSuccess);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
