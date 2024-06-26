import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class RatingWindowComponent extends StatelessWidget {
  const RatingWindowComponent(
      {super.key,
      this.selectedRating,
      required this.selectedRatingChange,
      required this.commentController,
      required this.orderCommentLoading,
      required this.onConfirm});

  final int? selectedRating;
  final Function(int) selectedRatingChange;
  final TextEditingController commentController;
  final bool orderCommentLoading;
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Material(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  StringsAssetsConstants.rating,
                  style: TextStyles.mediumLabelTextStyle(context).copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  StringsAssetsConstants.ratingDescription,
                  style: TextStyles.mediumBodyTextStyle(context).copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedRatingChange(4);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color:
                              selectedRating == 4 ? MainColors.warningColor(context)! : MainColors.disableColor(context)!.withOpacity(0.5),
                          width: selectedRating == 4 ? 3.r : 1.r,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagesAssetsConstants.rating1Image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      selectedRatingChange(3);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color:
                              selectedRating == 3 ? MainColors.warningColor(context)! : MainColors.disableColor(context)!.withOpacity(0.5),
                          width: selectedRating == 3 ? 3.r : 1.r,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagesAssetsConstants.rating2Image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      selectedRatingChange(2);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color:
                              selectedRating == 2 ? MainColors.warningColor(context)! : MainColors.disableColor(context)!.withOpacity(0.5),
                          width: selectedRating == 2 ? 3.r : 1.r,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagesAssetsConstants.rating3Image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      selectedRatingChange(1);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60.r,
                      width: 60.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000.r),
                        border: Border.all(
                          color:
                              selectedRating == 1 ? MainColors.warningColor(context)! : MainColors.disableColor(context)!.withOpacity(0.5),
                          width: selectedRating == 1 ? 3.r : 1.r,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          ImagesAssetsConstants.rating4Image,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              TextInputComponent(
                controller: commentController,
                label: StringsAssetsConstants.leaveAComment,
                isLabelOutside: true,
                maxLines: 4,
                maxLength: 80,
                hint: "${StringsAssetsConstants.leaveAComment}...",
              ),
              SizedBox(height: 25.h),
              PrimaryButtonComponent(
                width: 250.w,
                onTap: () => onConfirm(),
                text: StringsAssetsConstants.done,
                isLoading: orderCommentLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
