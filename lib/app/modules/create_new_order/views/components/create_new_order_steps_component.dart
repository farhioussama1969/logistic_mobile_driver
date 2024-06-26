import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class CreateNewOrderStepsComponent extends StatelessWidget {
  const CreateNewOrderStepsComponent({super.key, required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: step >= 1 ? 35.r : 15.r,
            width: step >= 1 ? 35.r : 15.r,
            decoration: BoxDecoration(
              color: step >= 1 ? MainColors.primaryColor : MainColors.inputColor(context),
              borderRadius: BorderRadius.circular(1000.r),
            ),
            child: Center(
              child: step >= 1
                  ? Text(
                      '1',
                      style: TextStyles.largeBodyTextStyle(context)!.copyWith(
                        color: MainColors.whiteColor,
                        fontFamily: FontsFamilyAssetsConstants.bold,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          SizedBox(width: 30.w),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: step >= 2 ? 35.r : 15.r,
            width: step >= 2 ? 35.r : 15.r,
            decoration: BoxDecoration(
              color: step >= 2 ? MainColors.primaryColor : MainColors.inputColor(context),
              borderRadius: BorderRadius.circular(1000.r),
            ),
            child: Center(
              child: step >= 2
                  ? Text(
                      '2',
                      style: TextStyles.largeBodyTextStyle(context)!.copyWith(
                        color: MainColors.whiteColor,
                        fontFamily: FontsFamilyAssetsConstants.bold,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          SizedBox(width: 30.w),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: step >= 3 ? 35.r : 15.r,
            width: step >= 3 ? 35.r : 15.r,
            decoration: BoxDecoration(
              color: step >= 3 ? MainColors.primaryColor : MainColors.inputColor(context),
              borderRadius: BorderRadius.circular(1000.r),
            ),
            child: Center(
              child: step >= 3
                  ? Text(
                      '3',
                      style: TextStyles.largeBodyTextStyle(context)!.copyWith(
                        color: MainColors.whiteColor,
                        fontFamily: FontsFamilyAssetsConstants.bold,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
