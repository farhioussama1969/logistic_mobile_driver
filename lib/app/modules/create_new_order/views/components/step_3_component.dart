import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/cards/tag_component.dart';
import 'package:loogisti/app/core/components/inputs/time_input_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/validator_util.dart';
import 'package:loogisti/app/modules/create_new_order/controllers/create_new_order_controller.dart';

class Step3Component extends StatelessWidget {
  const Step3Component(
      {super.key, required this.pickupTimeController, this.pickupTime, required this.onPickupTimeSelected, required this.formKey});

  final TextEditingController pickupTimeController;
  final DateTime? pickupTime;
  final Function(DateTime) onPickupTimeSelected;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewOrderController>(
        id: GetBuildersIdsConstants.createOrderStep3,
        builder: (logic) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: MainColors.backgroundColor(context),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: MainColors.shadowColor(context)!.withOpacity(0.5),
                  blurRadius: 30.r,
                  offset: Offset(0, 40.h),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: MainColors.primaryColor!.withOpacity(0.1),
                    border: Border.all(
                      color: MainColors.primaryColor,
                      width: 1.r,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          StringsAssetsConstants.step3Description,
                          style: TextStyles.largeBodyTextStyle(context).copyWith(
                            color: MainColors.primaryColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        IconsAssetsConstants.aboutUsIcon,
                        width: 22.r,
                        color: MainColors.primaryColor,
                      ),
                    ],
                  ),
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 900.ms, delay: 300.ms)
                    .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                    .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        StringsAssetsConstants.step3EnterTime,
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Checkbox(
                      value: logic.isChosenTime,
                      onChanged: (value) => logic.changeChosenTime(value ?? false),
                      activeColor: MainColors.primaryColor,
                    ),
                    Expanded(
                      child: Text(
                        StringsAssetsConstants.specificTime,
                        style: TextStyles.largeBodyTextStyle(context),
                      ),
                    ),
                  ],
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 900.ms, delay: 300.ms)
                    .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                    .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
                if (logic.isChosenTime) SizedBox(height: 10.h),
                if (logic.isChosenTime)
                  Form(
                    key: formKey,
                    child: TextInputComponent(
                      controller: pickupTimeController,
                      label: StringsAssetsConstants.preferredPickupTime,
                      isLabelOutside: true,
                      readOnly: true,
                      suffix: Row(
                        children: [
                          SizedBox(width: 10.w),
                          TimeInputComponent(
                            selectedDate: pickupTime,
                            callBack: onPickupTimeSelected,
                            child: TagComponent(title: StringsAssetsConstants.pickTime),
                          ),
                          SizedBox(width: 10.w),
                        ],
                      ),
                      borderColor: MainColors.textColor(context),
                      hint: '${StringsAssetsConstants.enter} ${StringsAssetsConstants.preferredPickupTime}...',
                      textInputType: TextInputType.number,
                      validate: (value) => ValidatorUtil.nullableValidation(pickupTime,
                          customMessage: '${StringsAssetsConstants.check} ${StringsAssetsConstants.pickTime}'),
                    ),
                  ),
                SizedBox(height: 15.h),
              ],
            ),
          );
        });
  }
}
