import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/unit_coversion_util.dart';
import 'package:loogisti/app/core/utils/validator_util.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class Step1Component extends StatelessWidget {
  const Step1Component(
      {super.key,
      required this.pickUpLocationController,
      required this.dropOffLocationController,
      this.pickUpLatitude,
      this.pickUpLongitude,
      this.dropOffLatitude,
      this.dropOffLongitude,
      required this.onPickUpLocationSelected,
      required this.onDropOffLocationSelected,
      required this.fromKey,
      required this.senderPhoneNumberController,
      required this.receiverPhoneNumberController,
      this.price,
      this.distance,
      required this.getPricingLoading});

  final TextEditingController pickUpLocationController;
  final TextEditingController dropOffLocationController;
  final double? pickUpLatitude;
  final double? pickUpLongitude;
  final double? dropOffLatitude;
  final double? dropOffLongitude;
  final Function(double? lat, double? lng) onPickUpLocationSelected;
  final Function(double? lat, double? lng) onDropOffLocationSelected;
  final GlobalKey fromKey;
  final TextEditingController senderPhoneNumberController;
  final TextEditingController receiverPhoneNumberController;
  final double? price;
  final double? distance;
  final bool getPricingLoading;

  @override
  Widget build(BuildContext context) {
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
      child: Form(
        key: fromKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    StringsAssetsConstants.pleasePickStartAndDestinationLocation,
                    style: TextStyles.largeBodyTextStyle(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(
                            StringsAssetsConstants.from,
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.textColor(context)!.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          IconsAssetsConstants.locationIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      height: 60.h,
                      child: VerticalDivider(
                        color: MainColors.textColor(context)!.withOpacity(0.3),
                        thickness: 2.w,
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            StringsAssetsConstants.to,
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.textColor(context)!.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          IconsAssetsConstants.locationIcon,
                          width: 22.r,
                          color: MainColors.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      TextInputComponent(
                        controller: pickUpLocationController,
                        label: StringsAssetsConstants.pickUpLocation,
                        isLabelOutside: true,
                        readOnly: true,
                        onTap: (context) async {
                          var result = await Get.toNamed(Routes.PICK_LOCATION, arguments: {
                            'latitude': pickUpLatitude,
                            'longitude': pickUpLongitude,
                          });
                          if (result != null) {
                            pickUpLocationController.text = result['address'];
                            onPickUpLocationSelected(result['latitude'], result['longitude']);
                          }
                        },
                        borderColor: MainColors.textColor(context),
                        hint: '${StringsAssetsConstants.pickUpLocation}...',
                        suffix: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: SvgPicture.asset(
                            IconsAssetsConstants.selectedLocationIcon,
                            width: 22.r,
                            color: MainColors.textColor(context),
                          ),
                        ),
                        validate: (value) {
                          if (pickUpLatitude == null || pickUpLongitude == null) {
                            return '${StringsAssetsConstants.check} ${StringsAssetsConstants.pickLocation}';
                          }
                        },
                      ),
                      SizedBox(height: 15.h),
                      TextInputComponent(
                        controller: dropOffLocationController,
                        label: StringsAssetsConstants.deliveryLocation,
                        isLabelOutside: true,
                        readOnly: true,
                        onTap: (context) async {
                          var result = await Get.toNamed(Routes.PICK_LOCATION, arguments: {
                            'latitude': dropOffLatitude,
                            'longitude': dropOffLongitude,
                          });
                          if (result != null) {
                            dropOffLocationController.text = result['address'];
                            onDropOffLocationSelected(result['latitude'], result['longitude']);
                          }
                        },
                        hint: '${StringsAssetsConstants.deliveryLocation}...',
                        borderColor: MainColors.textColor(context),
                        suffix: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: SvgPicture.asset(
                            IconsAssetsConstants.selectedLocationIcon,
                            width: 22.r,
                            color: MainColors.textColor(context),
                          ),
                        ),
                        validate: (value) {
                          if (dropOffLatitude == null || dropOffLongitude == null) {
                            return '${StringsAssetsConstants.check} ${StringsAssetsConstants.deliveryLocation}';
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            if (pickUpLatitude != null &&
                pickUpLongitude != null &&
                dropOffLatitude != null &&
                dropOffLongitude != null &&
                distance != null)
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: '${StringsAssetsConstants.estimatedDistance}: ',
                        style: TextStyles.largeBodyTextStyle(context),
                        children: [
                          TextSpan(
                            text: '${UnitConversionUtil.distanceInTextFormat(distance!.toInt() * 1000)}',
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 900.ms, delay: 300.ms)
                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
            if (pickUpLatitude != null && pickUpLongitude != null && dropOffLatitude != null && dropOffLongitude != null && price != null)
              SizedBox(height: 10.h),
            if (pickUpLatitude != null && pickUpLongitude != null && dropOffLatitude != null && dropOffLongitude != null && price != null)
              Row(
                children: [
                  SvgPicture.asset(
                    Get.locale?.languageCode == 'ar' ? IconsAssetsConstants.arrowLeftIcon : IconsAssetsConstants.arrowRightIcon,
                    width: 22.r,
                    color: MainColors.primaryColor,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: '${StringsAssetsConstants.deliveryPrice}: ',
                        style: TextStyles.mediumLabelTextStyle(context),
                        children: [
                          TextSpan(
                            text: '${price?.floor()} ${StringsAssetsConstants.currency}',
                            style: TextStyles.mediumLabelTextStyle(context).copyWith(
                              color: MainColors.primaryColor,
                              fontFamily: FontsFamilyAssetsConstants.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 900.ms, delay: 300.ms)
                  .shimmer(blendMode: BlendMode.srcOver, color: MainColors.backgroundColor(context)?.withOpacity(0.3))
                  .move(begin: const Offset(-100, 0), curve: Curves.easeOutQuad),
            if (getPricingLoading)
              LoadingAnimationWidget.staggeredDotsWave(
                color: MainColors.primaryColor,
                size: 30.r,
              ),
            if (pickUpLatitude != null &&
                pickUpLongitude != null &&
                dropOffLatitude != null &&
                dropOffLongitude != null &&
                price != null &&
                distance != null)
              SizedBox(height: 10.h),
            if (pickUpLatitude != null &&
                pickUpLongitude != null &&
                dropOffLatitude != null &&
                dropOffLongitude != null &&
                price != null &&
                distance != null)
              Divider(
                color: MainColors.textColor(context)!.withOpacity(0.1),
              ),
            if (pickUpLatitude != null &&
                pickUpLongitude != null &&
                dropOffLatitude != null &&
                dropOffLongitude != null &&
                price != null &&
                distance != null)
              SizedBox(height: 10.h),
            if (pickUpLatitude != null &&
                pickUpLongitude != null &&
                dropOffLatitude != null &&
                dropOffLongitude != null &&
                price != null &&
                distance != null)
              Column(
                children: [
                  TextInputComponent(
                    controller: senderPhoneNumberController,
                    label: StringsAssetsConstants.senderPhoneNumber,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.senderPhoneNumber}...',
                    textInputType: TextInputType.phone,
                    maxLength: 10,
                    prefix: Row(
                      children: [
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          IconsAssetsConstants.phoneIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    validate: (value) => ValidatorUtil.phoneValidation(value,
                        customMessage: '${StringsAssetsConstants.check} ${StringsAssetsConstants.senderPhoneNumber}'),
                  ),
                  SizedBox(height: 15.h),
                  TextInputComponent(
                    controller: receiverPhoneNumberController,
                    label: StringsAssetsConstants.receiverPhoneNumber,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.receiverPhoneNumber}...',
                    maxLength: 10,
                    textInputType: TextInputType.phone,
                    prefix: Row(
                      children: [
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          IconsAssetsConstants.phoneIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    validate: (value) => ValidatorUtil.phoneValidation(value,
                        customMessage: '${StringsAssetsConstants.check} ${StringsAssetsConstants.receiverPhoneNumber}'),
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
