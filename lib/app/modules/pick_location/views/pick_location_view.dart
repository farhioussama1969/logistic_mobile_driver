import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/buttons/back_button_component.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/buttons/primary_button_component.dart';
import 'package:loogisti/app/core/components/inputs/text_input_component.dart';
import 'package:loogisti/app/core/components/others/header_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:loogisti/app/core/utils/debouncer_util.dart';
import 'package:loogisti/app/modules/pick_location/views/components/places_suggestions_list_component.dart';

import '../../../core/constants/get_builders_ids_constants.dart';
import '../controllers/pick_location_controller.dart';

class PickLocationView extends GetView<PickLocationController> {
  const PickLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderComponent(title: StringsAssetsConstants.pickLocation),
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: GetBuilder<PickLocationController>(
              id: GetBuildersIdsConstants.chooseLocationOnMapGoogleMaps,
              builder: (mapController) {
                return GoogleMap(
                  initialCameraPosition: mapController.initialGoogleMapsCameraPosition ??
                      const CameraPosition(
                        target: LatLng(28.0339, 1.6596),
                        zoom: 4,
                      ),
                  onMapCreated: (googleMapsController) => mapController.updateGoogleMapsController(googleMapsController),
                  onCameraMove: (cameraPosition) {
                    controller.changeIsMapCameraMoving(true);
                    controller.currentLatitude = cameraPosition.target.latitude;
                    controller.currentLongitude = cameraPosition.target.longitude;
                  },
                  onCameraIdle: () {
                    controller.changeIsMapCameraMoving(false);
                  },
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  rotateGesturesEnabled: false,
                  myLocationEnabled: false,
                  myLocationButtonEnabled: false,
                  // markers:
                  //     Set<Marker>.of(mapController.googleMapsMarkers.values),
                );
              },
            ),
          ),
          IgnorePointer(
            child: Center(
              child: GetBuilder<PickLocationController>(
                id: GetBuildersIdsConstants.chooseLocationOnMapGoogleMapsMoving,
                builder: (logic) {
                  return AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: logic.isMapCameraMoving ? 3 : 1.5,
                      curve: Curves.easeInOutCubic,
                      child: SvgPicture.asset(
                        key: UniqueKey(),
                        IconsAssetsConstants.locationIcon,
                        color: MainColors.primaryColor,
                      ));
                },
              ),
            ),
          ),
          Container(
            width: 1.sw,
            //height: 1.sh,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: MainColors.backgroundColor(context),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: MainColors.shadowColor(context)!.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Focus(
                  onFocusChange: (hasFocus) {
                    if (hasFocus) {
                      controller.addressSearchController.selection =
                          TextSelection(baseOffset: 0, extentOffset: controller.addressSearchController.text.length);
                    }
                  },
                  child: TextInputComponent(
                    controller: controller.addressSearchController,
                    label: StringsAssetsConstants.pickUpLocation,
                    isLabelOutside: true,
                    borderColor: MainColors.textColor(context),
                    hint: '${StringsAssetsConstants.pickUpLocation}...',
                    onChange: (value) => DebouncerUtil.debounce(() => controller.getPlacesSuggestions(value)),
                    prefix: Row(
                      children: [
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          IconsAssetsConstants.searchIcon,
                          width: 22.r,
                          color: MainColors.textColor(context),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GetBuilder<PickLocationController>(
                  id: GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions,
                  builder: (logic) {
                    return PlacesSuggestionsListComponent(
                        placesSuggestions: logic.placesSuggestions,
                        isLoading: logic.getPlaceSuggestionsLoading,
                        show: logic.showPlacesSuggestions,
                        onBack: () {
                          logic.changeShowPlacesSuggestions(false);
                          FocusScope.of(context).unfocus();
                        },
                        onTap: (placesSuggestions) {
                          logic.changeShowPlacesSuggestions(false);
                          FocusScope.of(context).unfocus();
                          logic.changeStartingPosition(Position(
                            latitude: placesSuggestions.geometry!.location.lat,
                            longitude: placesSuggestions.geometry!.location.lng,
                            timestamp: DateTime.now(),
                            accuracy: 0,
                            altitude: 0,
                            heading: 0,
                            speed: 0,
                            speedAccuracy: 0,
                            altitudeAccuracy: 0,
                            floor: 0,
                            isMocked: false,
                            headingAccuracy: 0,
                          ));
                        });
                  },
                ),
              ],
            ),
          ),
          GetBuilder<PickLocationController>(
              id: GetBuildersIdsConstants.pickCurrentActionButton,
              builder: (logic) {
                return logic.showPlacesSuggestions
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GetBuilder<PickLocationController>(
                                id: GetBuildersIdsConstants.pickCurrentLocationButton,
                                builder: (logic) {
                                  return IconButtonComponent(
                                    iconLink: IconsAssetsConstants.myLocationIcon,
                                    onTap: () async => controller.enableAndGetStartingPositionFromGeolocator(),
                                    buttonHeight: 45.r,
                                    buttonWidth: 45.r,
                                    child: logic.getCurrentPositionLoading
                                        ? const LoadingComponent()
                                        : SvgPicture.asset(
                                            IconsAssetsConstants.myLocationIcon,
                                            color: MainColors.textColor(context),
                                            width: 22.r,
                                          ),
                                  );
                                }),
                            SizedBox(height: 10.h),
                            if (logic.currentLatitude != null &&
                                logic.currentLongitude != null &&
                                logic.addressSearchController.text.isNotEmpty)
                              PrimaryButtonComponent(
                                onTap: () {
                                  Get.back(result: {
                                    'latitude': logic.currentLatitude,
                                    'longitude': logic.currentLongitude,
                                    'address': logic.addressSearchController.text,
                                  });
                                },
                                text: StringsAssetsConstants.confirm,
                              ),
                          ],
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
