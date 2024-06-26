import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/modules/home/views/components/create_order_card_component.dart';
import 'package:loogisti/app/modules/home/views/components/home_note_component.dart';
import 'package:loogisti/app/modules/home/views/components/home_top_bar_component.dart';
import 'package:loogisti/app/modules/home/views/components/orders_section_component.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            HomeTopBarComponent()
                .animate(delay: 100.ms)
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                .move(begin: const Offset(0, -16), curve: Curves.easeOutQuad),
            GetBuilder<HomeController>(
              id: GetBuildersIdsConstants.homeOrders,
              builder: (logic) {
                return CreateOrderCardComponent(
                  count: logic.homeOrdersData?.count,
                  loading: logic.getOrdersLoading,
                );
              },
            )
                .animate(delay: 200.ms)
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
            GetBuilder<HomeController>(
              id: GetBuildersIdsConstants.homeNote,
              builder: (logic) {
                return logic.isNoticed
                    ? HomeNoteComponent(
                        onClose: () async {
                          logic.changeIsNoticed(false);
                          await LocalStorageService.saveData(
                              key: StorageKeysConstants.homeNoteVisibility, value: false, type: DataTypes.bool);
                        },
                      )
                    : SizedBox(height: 10.h);
              },
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 900.ms, delay: 300.ms)
                .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                .move(begin: const Offset(100, 0), curve: Curves.easeOutQuad),
            Expanded(
              child: GetBuilder<HomeController>(
                id: GetBuildersIdsConstants.homeOrders,
                builder: (logic) {
                  return OrdersSectionComponent(
                    orders: logic.homeOrdersData?.orders?.data ?? [],
                    loading: logic.getOrdersLoading,
                    scrollController: logic.scrollController,
                  );
                },
              ),
            ),
            // SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
