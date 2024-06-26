import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loogisti/app/core/constants/fonts_family_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class PlaceSuggestionCardComponent extends StatelessWidget {
  const PlaceSuggestionCardComponent({super.key, required this.placesSuggestions, required this.onTap});

  final PlacesSearchResult placesSuggestions;
  final Function(PlacesSearchResult placesSuggestions) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(placesSuggestions),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: MainColors.backgroundColor(context),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: MainColors.textColor(context)!.withOpacity(0.1),
            width: 1.r,
          ),
        ),
        child: Row(
          children: [
            Container(
                height: 40.r,
                width: 40.r,
                decoration: BoxDecoration(
                  color: MainColors.inputColor(context),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconsAssetsConstants.locationIcon,
                    width: 20.r,
                    color: MainColors.textColor(context)!.withOpacity(0.7),
                  ),
                )),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          placesSuggestions.name,
                          style: TextStyles.largeBodyTextStyle(context).copyWith(
                            fontFamily: FontsFamilyAssetsConstants.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          placesSuggestions.formattedAddress ?? '',
                          style: TextStyles.mediumBodyTextStyle(context).copyWith(
                            color: MainColors.textColor(context)!.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
