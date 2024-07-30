import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
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
                      for (int i = 0; i < (controller.contact?.numberContact?.length ?? 0); i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButtonComponent(
                                  child: NetworkImageComponent(
                                    imageLink: '${controller.contact?.numberContact?[i].photo}',
                                    loadingWidget: SizedBox(),
                                  ),
                                  onTap: () {
                                    if (controller.contact?.numberContact?[i].type == 'call') {
                                      UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.numberContact?[i].value}');
                                    } else if (controller.contact?.numberContact?[i].type == 'whatsapp') {
                                      UrlLauncherService.chatWithWhatsapp(
                                          phoneNUmber: '${controller.contact?.numberContact?[i].value}', message: '');
                                    } else if (controller.contact?.numberContact?[i].type == 'email') {
                                      UrlLauncherService.sendMail(
                                        mail: '${controller.contact?.numberContact?[i].value}',
                                      );
                                    } else {
                                      UrlLauncherService.openLink(link: '${controller.contact?.numberContact?[i].value}');
                                    }
                                  },
                                  iconWidth: 18.r,
                                  iconHeight: 18.r,
                                  border: Border.all(
                                    color: MainColors.disableColor(context)!.withOpacity(0.3),
                                    width: 2.r,
                                  ),
                                  iconLink: '',
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.contact?.numberContact?[i].type == 'call') {
                                        UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.numberContact?[i].value}');
                                      } else if (controller.contact?.numberContact?[i].type == 'whatsapp') {
                                        UrlLauncherService.chatWithWhatsapp(
                                            phoneNUmber: '${controller.contact?.numberContact?[i].value}', message: '');
                                      } else if (controller.contact?.numberContact?[i].type == 'email') {
                                        UrlLauncherService.sendMail(
                                          mail: '${controller.contact?.numberContact?[i].value}',
                                        );
                                      } else {
                                        UrlLauncherService.openLink(link: '${controller.contact?.numberContact?[i].value}');
                                      }
                                    },
                                    child: Text(
                                      '${controller.contact?.numberContact?[i].value}',
                                      style: TextStyles.largeBodyTextStyle(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
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
                      for (int i = 0; i < (controller.contact?.socialContact?.length ?? 0); i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButtonComponent(
                                  child: NetworkImageComponent(
                                    imageLink: '${controller.contact?.socialContact?[i].photo}',
                                    loadingWidget: SizedBox(),
                                  ),
                                  onTap: () {
                                    if (controller.contact?.socialContact?[i].type == 'call') {
                                      UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.socialContact?[i].value}');
                                    } else if (controller.contact?.socialContact?[i].type == 'whatsapp') {
                                      UrlLauncherService.chatWithWhatsapp(
                                          phoneNUmber: '${controller.contact?.socialContact?[i].value}', message: '');
                                    } else if (controller.contact?.socialContact?[i].type == 'email') {
                                      UrlLauncherService.sendMail(
                                        mail: '${controller.contact?.socialContact?[i].value}',
                                      );
                                    } else {
                                      UrlLauncherService.openLink(link: '${controller.contact?.socialContact?[i].value}');
                                    }
                                  },
                                  iconWidth: 18.r,
                                  iconHeight: 18.r,
                                  border: Border.all(
                                    color: MainColors.disableColor(context)!.withOpacity(0.3),
                                    width: 2.r,
                                  ),
                                  iconLink: '',
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.contact?.socialContact?[i].type == 'call') {
                                        UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.socialContact?[i].value}');
                                      } else if (controller.contact?.socialContact?[i].type == 'whatsapp') {
                                        UrlLauncherService.chatWithWhatsapp(
                                            phoneNUmber: '${controller.contact?.socialContact?[i].value}', message: '');
                                      } else if (controller.contact?.socialContact?[i].type == 'email') {
                                        UrlLauncherService.sendMail(
                                          mail: '${controller.contact?.socialContact?[i].value}',
                                        );
                                      } else {
                                        UrlLauncherService.openLink(link: '${controller.contact?.socialContact?[i].value}');
                                      }
                                    },
                                    child: Text(
                                      '${controller.contact?.socialContact?[i].value}',
                                      style: TextStyles.largeBodyTextStyle(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
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
                      for (int i = 0; i < (controller.contact?.socialLink?.length ?? 0); i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButtonComponent(
                                  child: NetworkImageComponent(
                                    imageLink: '${controller.contact?.socialLink?[i].photo}',
                                    loadingWidget: SizedBox(),
                                  ),
                                  onTap: () {
                                    if (controller.contact?.socialLink?[i].type == 'call') {
                                      UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.socialLink?[i].value}');
                                    } else if (controller.contact?.socialLink?[i].type == 'whatsapp') {
                                      UrlLauncherService.chatWithWhatsapp(
                                          phoneNUmber: '${controller.contact?.socialLink?[i].value}', message: '');
                                    } else if (controller.contact?.socialLink?[i].type == 'email') {
                                      UrlLauncherService.sendMail(
                                        mail: '${controller.contact?.socialLink?[i].value}',
                                      );
                                    } else {
                                      UrlLauncherService.openLink(link: '${controller.contact?.socialLink?[i].value}');
                                    }
                                  },
                                  iconWidth: 18.r,
                                  iconHeight: 18.r,
                                  border: Border.all(
                                    color: MainColors.disableColor(context)!.withOpacity(0.3),
                                    width: 2.r,
                                  ),
                                  iconLink: '',
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.contact?.socialLink?[i].type == 'call') {
                                        UrlLauncherService.callPhone(phoneNUmber: '${controller.contact?.socialLink?[i].value}');
                                      } else if (controller.contact?.socialLink?[i].type == 'whatsapp') {
                                        UrlLauncherService.chatWithWhatsapp(
                                            phoneNUmber: '${controller.contact?.socialLink?[i].value}', message: '');
                                      } else if (controller.contact?.socialLink?[i].type == 'email') {
                                        UrlLauncherService.sendMail(
                                          mail: '${controller.contact?.socialLink?[i].value}',
                                        );
                                      } else {
                                        UrlLauncherService.openLink(link: '${controller.contact?.socialLink?[i].value}');
                                      }
                                    },
                                    child: Text(
                                      '${controller.contact?.socialLink?[i].value}',
                                      style: TextStyles.largeBodyTextStyle(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
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
