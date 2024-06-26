import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class ProgressStatusWindowComponent extends StatelessWidget {
  const ProgressStatusWindowComponent({super.key, required this.success, required this.text, required this.onDone});

  final bool success;
  final String text;
  final Function onDone;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30.r)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    height: 100.r,
                    width: 100.r,
                    decoration: BoxDecoration(
                      color: success ? MainColors.successColor(context) : MainColors.errorColor(context),
                      borderRadius: BorderRadius.circular(1000.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        success ? IconsAssetsConstants.successIcon : IconsAssetsConstants.errorIcon,
                        color: MainColors.whiteColor,
                        width: 40.r,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    success ? StringsAssetsConstants.successfulProcess : StringsAssetsConstants.failedProcess,
                    style: TextStyles.mediumLabelTextStyle(context),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    text,
                    style: TextStyles.largeBodyTextStyle(context).copyWith(
                      color: MainColors.textColor(context)!.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: PrimaryButtonComponent(
                    onTap: () => onDone(),
                    text: StringsAssetsConstants.done,
                    backgroundColor: success ? MainColors.successColor(context) : MainColors.errorColor(context),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
