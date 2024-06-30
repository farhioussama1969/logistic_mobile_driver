import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/components/layouts/scrollable_body_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/components/windows/confirm_window_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/modules/my_account/views/components/my_account_item_component.dart';
import 'package:loogisti/app/modules/user_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(),
      body: SizedBox(
        width: double.infinity,
        child: ScrollableBodyComponent(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 10.h),
            GetBuilder<UserController>(
                id: GetBuildersIdsConstants.userInfosComponents,
                builder: (logic) {
                  return Column(
                    children: [
                      Container(
                        height: 140.r,
                        width: 140.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000.r),
                          child: NetworkImageComponent(
                            imageLink: '${logic.user?.photo}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          .animate(delay: 300.ms)
                          .fadeIn(duration: 900.ms, delay: 300.ms)
                          .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                          .move(begin: const Offset(0, -100), curve: Curves.easeOutQuad),
                      SizedBox(height: 14.h),
                      Center(
                        child: Text(
                          '${logic.user?.fullname}',
                          style: TextStyles.mediumLabelTextStyle(context),
                        ),
                      )
                          .animate(delay: 400.ms)
                          .fadeIn(duration: 900.ms, delay: 300.ms)
                          .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                          .move(begin: const Offset(100, 0), curve: Curves.easeOutQuad),
                      Center(
                        child: Text(
                          '${logic.user?.email}',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.6),
                          ),
                        ),
                      )
                          .animate(delay: 450.ms)
                          .fadeIn(duration: 900.ms, delay: 300.ms)
                          .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                          .move(begin: const Offset(100, 0), curve: Curves.easeOutQuad),
                      SizedBox(height: 40.h),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                StringsAssetsConstants.myAccount,
                                style: TextStyles.mediumLabelTextStyle(context),
                              )
                                  .animate(delay: 450.ms)
                                  .fadeIn(duration: 900.ms, delay: 300.ms)
                                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          MyAccountItemComponent(
                            iconLink: IconsAssetsConstants.myAccountIcon,
                            title: StringsAssetsConstants.myPersonalInformation,
                            onTap: () => Get.toNamed(Routes.MY_PERSONNEL_INFORMATION),
                          )
                              .animate(delay: 450.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Divider(color: MainColors.textColor(context)!.withOpacity(0.3), height: 1.h),
                      ),
                      SizedBox(height: 30.h),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                StringsAssetsConstants.support,
                                style: TextStyles.mediumLabelTextStyle(context),
                              )
                                  .animate(delay: 500.ms)
                                  .fadeIn(duration: 900.ms, delay: 300.ms)
                                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          MyAccountItemComponent(
                            iconLink: IconsAssetsConstants.contactUsIcon,
                            title: StringsAssetsConstants.contactUs,
                            onTap: () => Get.toNamed(Routes.CONTACT),
                          )
                              .animate(delay: 500.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 15.h),
                          MyAccountItemComponent(
                            iconLink: IconsAssetsConstants.aboutUsIcon,
                            title: StringsAssetsConstants.aboutUs,
                            onTap: () => Get.toNamed(Routes.ABOUT),
                          )
                              .animate(delay: 500.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 15.h),
                          MyAccountItemComponent(
                            iconLink: IconsAssetsConstants.termsIcon,
                            title: StringsAssetsConstants.termsAndConditions,
                            onTap: () => Get.toNamed(Routes.TERMS),
                          )
                              .animate(delay: 500.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                          SizedBox(height: 15.h),
                          MyAccountItemComponent(
                            iconLink: IconsAssetsConstants.deleteAccountIcon,
                            title: StringsAssetsConstants.deleteAccount,
                            onTap: () => showDeleteAccountConfirmationWindow(context),
                            hideArrow: true,
                          )
                              .animate(delay: 500.ms)
                              .fadeIn(duration: 900.ms, delay: 300.ms)
                              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      PrimaryButtonComponent(
                        onTap: () => showLogoutConfirmationWindow(context),
                        text: StringsAssetsConstants.logout,
                        backgroundColor: MainColors.backgroundColor(context),
                        textColor: MainColors.errorColor(context),
                        borderColor: MainColors.errorColor(context),
                        iconPath: IconsAssetsConstants.logoutIcon,
                        iconColor: MainColors.errorColor(context),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  void showLogoutConfirmationWindow(BuildContext context) {
    BottomSheetComponent.show(
      context,
      body: GetBuilder<UserController>(
        id: GetBuildersIdsConstants.logoutConfirmationWindow,
        builder: (logic) {
          return ConfirmWindowComponent(
            title: StringsAssetsConstants.logout,
            subtitle: StringsAssetsConstants.logoutConfirmationText,
            onCancel: () => Get.back(),
            onConfirm: () => logic.clearUser(),
            baseColor: MainColors.errorColor(context),
            // iconPath: ImagesAssetsConstants.logoutImage,
            isLoading: logic.logoutLoading,
            iconColor: null,
          );
        },
      ),
    );
  }

  void showDeleteAccountConfirmationWindow(BuildContext context) {
    BottomSheetComponent.show(
      context,
      body: GetBuilder<UserController>(
        id: GetBuildersIdsConstants.logoutConfirmationWindow,
        builder: (logic) {
          return ConfirmWindowComponent(
            title: StringsAssetsConstants.deleteAccount,
            subtitle: StringsAssetsConstants.deleteAccountDescription,
            onCancel: () => Get.back(),
            onConfirm: () => logic.clearUser(deleteAccount: true),
            baseColor: MainColors.errorColor(context),
            iconPath: ImagesAssetsConstants.logoutImage,
            isLoading: logic.logoutLoading,
            iconColor: null,
          );
        },
      ),
    );
  }
}
