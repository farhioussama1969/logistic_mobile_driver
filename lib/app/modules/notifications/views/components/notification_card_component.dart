import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/data/models/notification_model.dart';

class NotificationCardComponent extends StatelessWidget {
  const NotificationCardComponent({super.key, required this.notification, required this.deleteNotification, required this.isRead});
  final NotificationModel notification;
  final bool isRead;
  final Function(int notificationId) deleteNotification;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: MainColors.backgroundColor(context),
          border: Border.all(color: MainColors.disableColor(context)!.withOpacity(0.3), width: 1.5.r),
          borderRadius: BorderRadius.circular(15.r),
        ),
        //padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                color: notification.typeof == "1"
                    ? MainColors.inputColor(context)
                    : notification.typeof == "2"
                        ? MainColors.inputColor(context)
                        : notification.typeof == "3"
                            ? MainColors.inputColor(context)
                            : notification.typeof == "4"
                                ? MainColors.inputColor(context)
                                : notification.typeof == "5"
                                    ? MainColors.inputColor(context)
                                    : MainColors.primaryColor,
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: SvgPicture.asset(
                notification.typeof == "1"
                    ? IconsAssetsConstants.notificationDiscountIcon
                    : notification.typeof == "2"
                        ? IconsAssetsConstants.acceptedOrderNotificationIcon
                        : notification.typeof == "3"
                            ? IconsAssetsConstants.rejectedOrderNotificationIcon
                            : notification.typeof == "4"
                                ? IconsAssetsConstants.deliveredOrderNotificationIcon
                                : notification.typeof == "5"
                                    ? IconsAssetsConstants.acceptedOrderNotificationIcon
                                    : IconsAssetsConstants.notificationDiscountIcon,
                color: notification.typeof == "1"
                    ? MainColors.warningColor(context)
                    : notification.typeof == "2"
                        ? MainColors.successColor(context)
                        : notification.typeof == "3"
                            ? MainColors.errorColor(context)
                            : notification.typeof == "4"
                                ? MainColors.successColor(context)
                                : notification.typeof == "5"
                                    ? MainColors.successColor(context)
                                    : MainColors.whiteColor,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title ?? '',
                          style: TextStyles.mediumLabelTextStyle(context).copyWith(
                            fontSize: 16.sp,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        DateTime.now().toString().substring(10, 16),
                        style: TextStyles.mediumBodyTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          color: MainColors.disableColor(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.message ?? '',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }
}
