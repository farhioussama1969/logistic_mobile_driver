import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/url_launcher_service.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(title: StringsAssetsConstants.contactUs),
      body: GetBuilder<ContactController>(
        id: GetBuildersIdsConstants.contactBody,
        builder: (logic) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        StringsAssetsConstants.contactUsOnTheFollowingNumbers,
                        style: TextStyles.mediumLabelTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.phoneIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.phoneIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text(
                        StringsAssetsConstants.orContactUsVia,
                        style: TextStyles.mediumLabelTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.emailIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.whatsappLogoIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text(
                        StringsAssetsConstants.socialMedia,
                        style: TextStyles.mediumLabelTextStyle(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.facebookLogoIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          IconButtonComponent(
                            iconLink: IconsAssetsConstants.instagramIcon,
                            onTap: () {
                              UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                            },
                            iconWidth: 18.r,
                            iconHeight: 18.r,
                            border: Border.all(
                              color: MainColors.disableColor(context)!.withOpacity(0.3),
                              width: 2.r,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                UrlLauncherService.callPhone(phoneNUmber: '+213663095778');
                              },
                              child: Text(
                                '+213663095778',
                                style: TextStyles.largeBodyTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
