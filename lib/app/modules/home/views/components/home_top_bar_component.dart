import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/components/inputs/switch_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/modules/user_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class HomeTopBarComponent extends StatelessWidget {
  const HomeTopBarComponent({super.key, required this.isAvailable, required this.onAvailableChange});

  final bool isAvailable;
  final Function(bool value) onAvailableChange;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 20.h, bottom: 20.h),
      child: Row(children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.MY_ACCOUNT),
                    child: Container(
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color: MainColors.primaryColor,
                          width: 4.r,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000.r),
                        child: GetBuilder<UserController>(
                            id: GetBuildersIdsConstants.userInfosComponents,
                            builder: (logic) {
                              return NetworkImageComponent(
                                imageLink: '${logic.user?.photo}',
                                fit: BoxFit.cover,
                              );
                            }),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GetBuilder<UserController>(
                        id: GetBuildersIdsConstants.userInfosComponents,
                        builder: (logic) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.MY_ACCOUNT),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${logic.user?.fullname}',
                                  style: TextStyles.mediumLabelTextStyle(context),
                                ),
                                Text(
                                  'Algeria, ben aknoun',
                                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                                    color: MainColors.textColor(context)!.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            SwitchComponent(
              onChange: (value) => onAvailableChange(value),
              enable: isAvailable,
            ),
            SizedBox(width: 5.w),
            Text(
              isAvailable ? StringsAssetsConstants.available : StringsAssetsConstants.busy,
              style: TextStyles.mediumBodyTextStyle(context).copyWith(
                color: isAvailable ? MainColors.successColor(context) : MainColors.disableColor(context),
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w),
        IconButtonComponent(
          iconLink: IconsAssetsConstants.notificationIcon,
          onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
          buttonWidth: 40.r,
          buttonHeight: 40.r,
          iconWidth: 20.r,
          iconHeight: 20.r,
        ),
      ]),
    ));
  }
}
