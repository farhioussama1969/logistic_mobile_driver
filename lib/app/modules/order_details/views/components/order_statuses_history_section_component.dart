import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_status_card_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/data/models/order_status_model.dart';

class OrderStatusesHistorySectionComponent extends StatelessWidget {
  const OrderStatusesHistorySectionComponent({super.key, required this.orderStatusData});

  final List<OrderStatusModel> orderStatusData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderStatusCardComponent(
          orderStatusData: orderStatusData[index],
        )
            .animate(delay: (index * 200).ms)
            .fadeIn(duration: 900.ms, delay: 400.ms)
            .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
            .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad);
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 30.h,
          child: Row(
            children: [
              SizedBox(width: 30.w),
              VerticalDivider(
                color: MainColors.textColor(context)!.withOpacity(0.1),
                thickness: 2.r,
              ),
            ],
          ),
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 15.h),
      itemCount: orderStatusData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
