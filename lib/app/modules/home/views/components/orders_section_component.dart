import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/cards/order_card_component.dart';
import 'package:loogisti/app/core/components/others/empty_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/data/models/order_model.dart';
import 'package:loogisti/app/modules/home/views/components/create_order_card_big_component.dart';

class OrdersSectionComponent extends StatelessWidget {
  const OrdersSectionComponent(
      {super.key, required this.orders, required this.loading, required this.scrollController, required this.onAcceptOrReject});

  final List<OrderModel> orders;
  final bool loading;
  final ScrollController scrollController;
  final Function(int index, bool isAccept) onAcceptOrReject;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  StringsAssetsConstants.orders,
                  style: TextStyles.mediumLabelTextStyle(context),
                ),
              ],
            ),
          )
              .animate(delay: (50).ms)
              .fadeIn(duration: 900.ms, delay: 300.ms)
              .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
              .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
          (!orders.isEmpty || (orders.isEmpty && loading))
              ? ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h, bottom: 30.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return OrderCardComponent(
                      orderData: index < orders.length ? orders[index] : null,
                      onAccept: () => onAcceptOrReject(index, true),
                      onReject: () => onAcceptOrReject(index, false),
                    )
                        .animate(delay: (index * 100).ms)
                        .fadeIn(duration: 900.ms, delay: 300.ms)
                        .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                        .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 22.h);
                  },
                  itemCount: orders.isNotEmpty
                      ? loading
                          ? orders.length + 8
                          : orders.length
                      : 10,
                )
              : Column(
                  children: [
                    SizedBox(height: 10.h),
                    CreateOrderCardBigComponent(),
                  ],
                ),
        ],
      ),
    );
  }
}
