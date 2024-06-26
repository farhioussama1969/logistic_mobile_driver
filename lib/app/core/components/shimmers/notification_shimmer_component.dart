import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loogisti/app/core/components/others/shimmer_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class NotificationsShimmerComponent extends StatelessWidget {
  const NotificationsShimmerComponent({super.key, required this.isExpanded});

  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.backgroundColor(context),
        border: Border.all(color: MainColors.disableColor(context)!.withOpacity(0.3), width: 1.r),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          ShimmerComponent(
            child: Container(
              alignment: Alignment.center,
              width: 100.r,
              height: 100.r,
              decoration: BoxDecoration(
                border: Border.all(color: MainColors.disableColor(context)!),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                //notification.iconLink ??
                IconsAssetsConstants.notificationIcon,
                color: MainColors.disableColor(context),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: ShimmerComponent(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MainColors.backgroundColor(context),
                      ),
                      height: 15.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: ShimmerComponent(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MainColors.backgroundColor(context),
                      ),
                      height: 15.h,
                      width: 0.3.sw,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: ShimmerComponent(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MainColors.backgroundColor(context),
                      ),
                      height: 15.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
