import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/home_orders_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/auth_provider.dart';
import 'package:loogisti/app/data/providers/loogistic_api/order_provider.dart';

class HomeController extends GetxController {
  bool isNoticed = true;
  void changeIsNoticed(bool value) {
    isNoticed = value;
    update([GetBuildersIdsConstants.homeNote]);
  }

  final ScrollController scrollController = ScrollController();

  HomeOrdersModel? homeOrdersData;

  void scrollEvent() {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      if (scrollController.offset > maxScroll * 0.8) {
        if (!getOrdersLoading) {
          if (currentOrdersPage < (homeOrdersData?.orders?.meta?.lastPage ?? 0)) {
            currentOrdersPage++;
            getHomeOrdersData();
          }
        }
      }
    });
  }

  int currentOrdersPage = 1;

  bool getOrdersLoading = false;
  void changeOrdersLoading(bool value) {
    getOrdersLoading = value;
    update([GetBuildersIdsConstants.homeOrders]);
  }

  void changeHomeOrdersData(HomeOrdersModel? newData, {bool? refresh}) {
    if (refresh == true) {
      homeOrdersData = null;
    } else {
      if (homeOrdersData?.orders?.data?.isNotEmpty == true) {
        homeOrdersData?.orders?.data?.addAll(newData?.orders?.data ?? []);
        homeOrdersData?.orders?.meta = newData?.orders?.meta;
      } else {
        homeOrdersData = newData;
      }
    }
    update([GetBuildersIdsConstants.homeOrders]);
  }

  void getHomeOrdersData() {
    OrderProvider()
        .getHomeOrders(
      page: currentOrdersPage,
      onLoading: () => changeOrdersLoading(true),
      onFinal: () => changeOrdersLoading(false),
    )
        .then(
      (value) {
        if (value != null) {
          changeHomeOrdersData(value);
        }
      },
    );
  }

  void refreshHome() {
    currentOrdersPage = 1;
    changeHomeOrdersData(null, refresh: true);
    getHomeOrdersData();
  }

  bool isAvailable = false;
  Future<void> changeIsAvailable(bool value, {bool? withoutRequest}) async {
    isAvailable = value;
    update([GetBuildersIdsConstants.homeAppBar]);
    await LocalStorageService.saveData(key: StorageKeysConstants.driverAvailability, value: isAvailable, type: DataTypes.bool);
    if (withoutRequest != true) {
      isAvailable = (await changeAvailableStatus()) ?? false;
      await LocalStorageService.saveData(key: StorageKeysConstants.driverAvailability, value: isAvailable, type: DataTypes.bool);
      update([GetBuildersIdsConstants.homeAppBar]);
    }
  }

  Future<bool?> changeAvailableStatus() async {
    return (await AuthProvider().changeDriverStatus(
      onLoading: () {},
      onFinal: () {},
    ));
  }

  void acceptOrRejectOrder(int index, {required bool isAccept}) {
    if (isAccept) {
      if (homeOrdersData?.orders?.data?[index].acceptingLoading == true) return;
      OrderProvider()
          .orderAction(
              orderId: homeOrdersData?.orders?.data?[index].id,
              statusId: homeOrdersData?.orders?.data?[index].acceptButton,
              onLoading: () {
                homeOrdersData?.orders?.data?[index].acceptingLoading = true;
                update([GetBuildersIdsConstants.homeOrders]);
              },
              onFinal: () {
                homeOrdersData?.orders?.data?[index].acceptingLoading = false;
                update([GetBuildersIdsConstants.homeOrders]);
              })
          .then(
        (value) {
          if (value != null) {
            refreshHome();
          }
        },
      );
    }
  }

  bool isThereIsANewNotification = false;
  void changeIsThereIsANewNotification(bool value) {
    isThereIsANewNotification = value;
    update([GetBuildersIdsConstants.homeNotification]);
  }

  @override
  Future<void> onInit() async {
    getHomeOrdersData();
    changeIsAvailable(await LocalStorageService.loadData(key: StorageKeysConstants.driverAvailability, type: DataTypes.bool) ?? false,
        withoutRequest: true);
    changeIsThereIsANewNotification(
        await LocalStorageService.loadData(key: StorageKeysConstants.newNotification, type: DataTypes.bool) ?? false);
    super.onInit();
  }

  @override
  void onReady() {
    scrollEvent();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
