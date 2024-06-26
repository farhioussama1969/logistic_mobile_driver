import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class SocialLoginButtonComponent extends StatelessWidget {
  const SocialLoginButtonComponent(
      {super.key, required this.iconPath, this.iconColor, required this.title, required this.onTap, required this.isLoading});

  final String iconPath;
  final Color? iconColor;
  final String title;
  final Function onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        border: Border.all(
          color: MainColors.textColor(context)!.withOpacity(0.1),
          width: 1.r,
        ),
        borderRadius: BorderRadius.circular(1000.r),
        boxShadow: [
          BoxShadow(
            color: MainColors.primaryColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10.r,
            offset: Offset(0, 3.h), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000.r)),
          backgroundColor: MainColors.transparentColor,
          primary: MainColors.primaryColor,
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading == true)
              const LoadingComponent(
                color: MainColors.primaryColor,
              ),
            if (isLoading == false || isLoading == null)
              Expanded(
                child: Center(
                    child: Row(
                  textBaseline: TextBaseline.ideographic,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconPath != null)
                      SvgPicture.asset(
                        iconPath!,
                        width: 28.r,
                        color: iconColor,
                      ),
                    SizedBox(width: 20.w),
                    Text(
                      title,
                      style: TextStyles.buttonTextStyle(context).copyWith(
                        color: MainColors.textColor(context),
                      ),
                    ),
                  ],
                )),
              ),
          ],
        ),
      ),
    );
  }
}
