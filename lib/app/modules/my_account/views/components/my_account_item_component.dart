import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class MyAccountItemComponent extends StatelessWidget {
  const MyAccountItemComponent({super.key, required this.iconLink, required this.onTap, required this.title, this.hideArrow});

  final String iconLink;
  final Function onTap;
  final String title;
  final bool? hideArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: MainColors.backgroundColor(context),
        child: Row(
          children: [
            IconButtonComponent(
              iconLink: iconLink,
              onTap: () {},
              border: Border.all(
                color: MainColors.textColor(context)!.withOpacity(0.2),
              ),
              iconHeight: 26.r,
              iconWidth: 26.r,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                title,
                style: TextStyles.largeBodyTextStyle(context),
              ),
            ),
            SizedBox(width: 5.w),
            if (hideArrow != true)
              SvgPicture.asset(
                Get.locale!.languageCode == 'ar' ? IconsAssetsConstants.arrowLeftIcon : IconsAssetsConstants.arrowRightIcon,
                width: 25.r,
                color: MainColors.textColor(context),
              ),
          ],
        ),
      ),
    );
  }
}
