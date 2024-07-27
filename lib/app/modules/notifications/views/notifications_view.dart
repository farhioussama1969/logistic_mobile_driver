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
import 'package:loogisti/app/core/utils/translation_util.dart';
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
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: (controller.getNotificationsLoading && ((logic.notificationsData?.data ?? []).isEmpty))
                                              ? ListView.separated(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.only(top: 30.h, bottom: 170.h),
                                                  itemBuilder: (context, index) {
                                                    return const NotificationsShimmerComponent(
                                                      isExpanded: true,
                                                    );
                                                  },
                                                  separatorBuilder: (context, index) {
                                                    return SizedBox(
                                                      height: 25.h,
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
                                                        // GroupedListView<NotificationModel, String>(
                                                        //   controller: controller
                                                        //       .notificationsScrollController,

                                                        //   physics: const BouncingScrollPhysics(
                                                        //       parent:
                                                        //           AlwaysScrollableScrollPhysics()),
                                                        //   elements: controller
                                                        //           .notificationsData()
                                                        //           ?.data ??
                                                        //       [],
                                                        //   groupBy: (notification) => (notification
                                                        //               .createdAt !=
                                                        //           null)
                                                        //       ? DateFormat('dd-MM-yyyy').format(
                                                        //           DateTime.parse(
                                                        //               notification.createdAt ?? ''))
                                                        //       : '',
                                                        //   // groupComparator: (value1, value2) =>
                                                        //   //     value1.compareTo(value2),
                                                        //   itemComparator: (item1, item2) =>
                                                        //       (item1.createdAt != null &&
                                                        //               item2.createdAt != null)
                                                        //           ? RelativeDateUtil
                                                        //                   .getUnixTimeFromDateTime(
                                                        //                       DateTime.parse(
                                                        //                           item1.createdAt!))
                                                        //               .compareTo(RelativeDateUtil
                                                        //                   .getUnixTimeFromDateTime(
                                                        //                       DateTime.parse(
                                                        //                           item2.createdAt!)))
                                                        //           : 0,
                                                        //   // order: GroupedListOrder.DESC,
                                                        //   order: GroupedListOrder.DESC,
                                                        //   useStickyGroupSeparators: false,
                                                        //   separator: SizedBox(
                                                        //     height: 15.h,
                                                        //   ),
                                                        //   groupSeparatorBuilder: (String date) =>
                                                        //       Padding(
                                                        //     padding: EdgeInsets.symmetric(
                                                        //         vertical: 20.h, horizontal: 10.w),
                                                        //     child: Text(
                                                        //       "${DateFormat('EEEE', TranslationUtil.currentLang?.languageCode).format(DateFormat('dd-MM-yyyy').parse(date))}, ${DateFormat('d').format(DateFormat('dd-MM-yyyy').parse(date))} ${DateFormat('MMMM', TranslationUtil.currentLang?.languageCode).format(DateFormat('dd-MM-yyyy').parse(date))} ${DateFormat('y').format(DateFormat('dd-MM-yyyy').parse(date))}",
                                                        //       textAlign: TextAlign.start,
                                                        //       style:
                                                        //           TextStyles.mediumLabelTextStyle(
                                                        //               context),
                                                        //     ),
                                                        //   ),
                                                        //   itemBuilder: (context, notification) {
                                                        //     // controller.getAllNotification();
                                                        //     return NotificationCardComponent(
                                                        //       isRead: notification.readAt != null,
                                                        //       notification: notification,
                                                        //       deleteNotification:
                                                        //           (notificationId) =>
                                                        //               controller.deleteNotification(
                                                        //                   notificationId),
                                                        //     );
                                                        //   },

                                                        // ListView.builder(
                                                        //   itemCount: controller
                                                        //       .notificationsData()!
                                                        //       .data
                                                        //       ?.length,
                                                        //   controller: controller
                                                        //       .notificationsScrollController,
                                                        //   itemBuilder: (context, index) {
                                                        //     final notification = controller
                                                        //         .notificationsData()!
                                                        //         .data![index];

                                                        //     // التحقق من أن الإشعار الحالي ليس هو الإشعار الأول وله نفس التاريخ مثل الإشعار السابق
                                                        //     final isDifferentDay = index > 0 &&
                                                        //         DateFormat('dd-MM-yyyy').format(
                                                        //                 DateTime.parse(notification
                                                        //                     .createdAt!)) !=
                                                        //             DateFormat('dd-MM-yyyy').format(
                                                        //                 DateTime.parse(controller
                                                        //                     .notificationsData()!
                                                        //                     .data![index - 1]
                                                        //                     .createdAt!));

                                                        //     return Column(
                                                        //       crossAxisAlignment:
                                                        //           CrossAxisAlignment.start,
                                                        //       children: [
                                                        //         // إذا كان التاريخ مختلفًا عن الإشعار السابق، قم بعرض التاريخ
                                                        //         if (isDifferentDay)
                                                        //           Padding(
                                                        //             padding: EdgeInsets.symmetric(
                                                        //                 vertical: 20.h,
                                                        //                 horizontal: 10.w),
                                                        //             child: Text(
                                                        //               "${DateFormat('EEEE', TranslationUtil.currentLang?.languageCode).format(DateTime.parse(notification.createdAt!))}, ${DateFormat('d').format(DateTime.parse(notification.createdAt!))} ${DateFormat('MMMM', TranslationUtil.currentLang?.languageCode).format(DateTime.parse(notification.createdAt!))} ${DateFormat('y').format(DateTime.parse(notification.createdAt!))}",
                                                        //               textAlign: TextAlign.start,
                                                        //               style: TextStyles
                                                        //                   .mediumLabelTextStyle(
                                                        //                       context),
                                                        //             ),
                                                        //           ),
                                                        //         // عرض عنصر الإشعار
                                                        //         NotificationCardComponent(
                                                        //           isRead:
                                                        //               notification.readAt != null,
                                                        //           notification: notification,
                                                        //           deleteNotification:
                                                        //               (notificationId) => controller
                                                        //                   .deleteNotification(
                                                        //                       notificationId),
                                                        //         ),
                                                        //       ],
                                                        //     );
                                                        //   },
                                                        // ),
                                                        ListView.builder(
                                                          itemCount: (logic.notificationsData?.data ?? []).length,
                                                          controller: controller.scrollController,
                                                          itemBuilder: (context, index) {
                                                            final notification = (logic.notificationsData?.data ?? [])[index];

                                                            final isDifferentDay = index > 0 &&
                                                                DateFormat('dd-MM-yyyy').format(DateTime.parse(notification.createdAt!)) !=
                                                                    DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                                                        (logic.notificationsData?.data ?? [])[index - 1].createdAt!));

                                                            return Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                if (isDifferentDay || index == 0)
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                                                                    child: Text(
                                                                      "${DateFormat('EEEE', TranslationUtil.currentLang?.languageCode).format(DateTime.parse(notification.createdAt!))}, ${DateFormat('d').format(DateTime.parse(notification.createdAt!))} ${DateFormat('MMMM', TranslationUtil.currentLang?.languageCode).format(DateTime.parse(notification.createdAt!))} ${DateFormat('y').format(DateTime.parse(notification.createdAt!))}",
                                                                      textAlign: TextAlign.start,
                                                                      style: TextStyles.mediumLabelTextStyle(context),
                                                                    ),
                                                                  ),
                                                                NotificationCardComponent(
                                                                  isRead: false,
                                                                  notification: notification,
                                                                  deleteNotification: (notificationId) {},
                                                                ),
                                                                SizedBox(height: 10.r),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        AnimatedPositioned(
                                                          bottom: (controller.getNotificationsLoading &&
                                                                  ((logic.notificationsData?.data) != null &&
                                                                      (logic.notificationsData?.data ?? []).isNotEmpty == true))
                                                              ? 30.h
                                                              : -100.h,
                                                          duration: const Duration(milliseconds: 300),
                                                          child: const SizedBox(),
                                                        ),
                                                      ],
                                                    ),
                                        )
                                      ],
                                    ),
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
