import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:loogisti/app/core/components/buttons/back_button_component.dart';
import 'package:loogisti/app/core/components/others/empty_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/shimmers/notification_shimmer_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/relative_date_util.dart';
import 'package:loogisti/app/data/models/notification_model.dart';
import 'package:loogisti/app/modules/notifications/views/components/notification_card_component.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(
        title: StringsAssetsConstants.notifications,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: MainColors.backgroundColor(context),
              ),
              child: GetBuilder<NotificationsController>(
                  id: GetBuildersIdsConstants.notificationsList,
                  builder: (logic) {
                    return (logic.getNotificationsLoading && (logic.notificationsData?.data ?? []).isEmpty)
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 30.h, bottom: 170.h, right: 20.w, left: 20.w),
                            itemBuilder: (context, index) {
                              return const NotificationsShimmerComponent(
                                isExpanded: true,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15.h,
                              );
                            },
                            itemCount: 8,
                          )
                        : (logic.notificationsData?.data ?? []).isEmpty
                            ? EmptyComponent(
                                text: StringsAssetsConstants.emptyNotifications,
                              )
                            : Stack(
                                children: [
                                  GroupedListView<NotificationModel, String>(
                                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                                    controller: logic.scrollController,
                                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                    elements: controller.notificationsData?.data ?? [],
                                    groupBy: (notification) => (notification.createdAt != null)
                                        ? DateFormat('d-MM-yyyy').format(DateTime.parse(notification.createdAt ?? ''))
                                        : '',
                                    // groupComparator: (value1, value2) =>
                                    //     value1.compareTo(value2),
                                    itemComparator: (item1, item2) => (item1.createdAt != null && item2.createdAt != null)
                                        ? RelativeDateUtil.getUnixTimeFromDateTime(DateTime.parse(item1.createdAt ?? ''))
                                            .compareTo(RelativeDateUtil.getUnixTimeFromDateTime(DateTime.parse(item2.createdAt ?? '')))
                                        : 0,
                                    order: GroupedListOrder.DESC,
                                    useStickyGroupSeparators: false,
                                    separator: SizedBox(
                                      height: 15.h,
                                    ),
                                    groupSeparatorBuilder: (String date) => Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                                      child: Text(
                                        "${DateFormat('EEEE', Get.locale?.languageCode).format(DateFormat('dd-MM-yyyy').parse(date))}, ${DateFormat('d', Get.locale?.languageCode).format(DateFormat(
                                          'dd-MM-yyyy',
                                        ).parse(date))} ${DateFormat('MMMM', Get.locale?.languageCode).format(DateFormat('dd-MM-yyyy').parse(date))} ${DateFormat('y', Get.locale?.languageCode).format(DateFormat('dd-MM-yyyy').parse(date))}",
                                        textAlign: TextAlign.start,
                                        style: TextStyles.mediumLabelTextStyle(context),
                                      ),
                                    ),
                                    itemBuilder: (context, notification) {
                                      return NotificationCardComponent(
                                        isRead: false,
                                        notification: notification,
                                        deleteNotification: (notificationId) => {},
                                      );
                                    },
                                  ),
                                ],
                              );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
