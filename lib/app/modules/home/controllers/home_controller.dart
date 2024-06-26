import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/home_orders_model.dart';
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

  @override
  Future<void> onInit() async {
    getHomeOrdersData();
    changeIsNoticed(await LocalStorageService.loadData(key: StorageKeysConstants.homeNoteVisibility, type: DataTypes.bool) ?? true);
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
