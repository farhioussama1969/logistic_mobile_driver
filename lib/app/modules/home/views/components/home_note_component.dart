import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class HomeNoteComponent extends StatelessWidget {
  const HomeNoteComponent({super.key, required this.onClose});

  final Function onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: MainColors.textColor(context)!.withOpacity(0.3),
          width: 1.3.r,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(22.r),
                  child: AnimatorComponent(
                    time: const Duration(milliseconds: 300),
                    child: Text(
                      StringsAssetsConstants.homeNote,
                      style: TextStyles.largeBodyTextStyle(context),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(4.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButtonComponent(
                  onTap: () => onClose(),
                  iconLink: IconsAssetsConstants.closeIcon,
                  buttonWidth: 18.r,
                  buttonHeight: 18.r,
                  iconWidth: 13.r,
                  iconHeight: 13.r,
                  backgroundColor: MainColors.disableColor(context)?.withOpacity(0.5),
                  iconColor: MainColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
