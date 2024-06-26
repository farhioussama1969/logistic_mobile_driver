import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/data/models/notification_model.dart';
import 'package:loogisti/app/data/models/pagination_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/notification_provider.dart';

class NotificationsController extends GetxController {
  final ScrollController scrollController = ScrollController();

  bool getNotificationsLoading = false;
  void changeGetNotificationsLoading(bool value, {bool? withoutBuilder}) {
    getNotificationsLoading = value;
    if (withoutBuilder != true) {
      update([GetBuildersIdsConstants.notificationsList]);
    }
  }

  PaginationModel<NotificationModel>? notificationsData;
  void changeNotificationsData(PaginationModel<NotificationModel>? newData, {bool? refresh}) {
    if (refresh == true) {
      notificationsData = null;
    } else {
      if (notificationsData?.data?.isNotEmpty == true) {
        notificationsData?.data?.addAll(newData?.data ?? []);
        notificationsData?.meta = newData?.meta;
      } else {
        notificationsData = newData;
      }
    }
    update([GetBuildersIdsConstants.notificationsList]);
  }

  int currentPage = 1;
  void getNotificationsData() {
    NotificationProvider()
        .getNotifications(
      page: currentPage,
      onLoading: () => changeGetNotificationsLoading(true),
      onFinal: () => changeGetNotificationsLoading(false),
    )
        .then(
      (value) {
        if (value != null) {
          changeNotificationsData(value);
        }
      },
    );
  }

  void scrollEvent() {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      if (scrollController.offset > maxScroll * 0.8) {
        if (!getNotificationsLoading) {
          if (currentPage < (notificationsData?.meta?.lastPage ?? 0)) {
            currentPage++;
            getNotificationsData();
          }
        }
      }
    });
  }

  @override
  void onInit() {
    getNotificationsData();
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
