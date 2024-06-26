import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/others/empty_component.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/modules/pick_location/views/components/places_suggestion_card_component.dart';

class PlacesSuggestionsListComponent extends StatelessWidget {
  const PlacesSuggestionsListComponent(
      {super.key, required this.placesSuggestions, required this.isLoading, required this.show, required this.onTap, required this.onBack});

  final List<PlacesSearchResult> placesSuggestions;
  final bool isLoading;
  final bool show;
  final Function(PlacesSearchResult placesSuggestions) onTap;
  final Function onBack;

  @override
  Widget build(BuildContext context) {
    return show
        ? isLoading
            ? Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 15.h),
                    const LoadingComponent(),
                    SizedBox(height: 30.h),
                  ],
                ),
              )
            : Expanded(
                child: placesSuggestions.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                        itemBuilder: (context, index) {
                          return PlaceSuggestionCardComponent(
                            placesSuggestions: placesSuggestions[index],
                            onTap: (placesSuggestions) => onTap(placesSuggestions),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15.h);
                        },
                        itemCount: placesSuggestions.length,
                      )
                    : Column(
                        children: [
                          EmptyComponent(
                            text: StringsAssetsConstants.placesNotFound,
                          ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.h),
                            child: PrimaryButtonComponent(
                              text: StringsAssetsConstants.back,
                              onTap: () => onBack(),
                            ),
                          ),
                        ],
                      ),
              )
        : const SizedBox.shrink();
  }
}
