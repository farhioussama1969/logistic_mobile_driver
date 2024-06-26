import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderComponent(title: StringsAssetsConstants.termsAndConditions),
      body: GetBuilder<TermsController>(
          id: GetBuildersIdsConstants.termsAndConditionsBody,
          builder: (logic) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              width: double.infinity,
              child: logic.termsAndConditionsLoading
                  ? Center(
                      child: LoadingComponent(),
                    )
                  : SingleChildScrollView(
                      child: HtmlWidget(
                        logic.termsAndConditions ?? '',
                        textStyle: TextStyles.mediumBodyTextStyle(context).copyWith(
                          color: MainColors.textColor(context)!.withOpacity(0.8),
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}
