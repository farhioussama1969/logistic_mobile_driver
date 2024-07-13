import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/relative_date_util.dart';
import 'package:loogisti/app/data/models/order_status_model.dart';

class OrderStatusCardComponent extends StatelessWidget {
  const OrderStatusCardComponent({super.key, required this.orderStatusData});

  final OrderStatusModel orderStatusData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.r,
          width: 80.r,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: orderStatusData.backgroundColor ?? MainColors.inputColor(context),
            borderRadius: BorderRadius.circular(1000.r),
            border: Border.all(
              color: MainColors.textColor(context)!.withOpacity(0.1),
              width: 2.r,
            ),
          ),
          child: Container(
            height: 60.r,
            width: 60.r,
            child: Center(
              child: NetworkImageComponent(
                imageLink: '${orderStatusData.icon}',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      orderStatusData.name ?? '',
                      style: TextStyles.mediumLabelTextStyle(context).copyWith(
                        color: orderStatusData.color,
                      ),
                    ),
                  ),
                  Text(
                    RelativeDateUtil.getRelativeDateSinceNow(
                        relativeDateInUnix: DateTime.parse('${orderStatusData.createdAt}').millisecondsSinceEpoch),
                    style: TextStyles.mediumBodyTextStyle(context).copyWith(
                      color: MainColors.textColor(context)!.withOpacity(0.6),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      orderStatusData.title ?? '',
                      style: TextStyles.mediumBodyTextStyle(context).copyWith(
                        color: MainColors.textColor(context)!.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
