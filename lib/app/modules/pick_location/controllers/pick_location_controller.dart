import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loogisti/app/core/services/geolocator_location_service.dart';

import '../../../core/constants/get_builders_ids_constants.dart';
import '../../../core/services/geocoding_service.dart';

class PickLocationController extends GetxController {
  final TextEditingController addressSearchController = TextEditingController();

  double? currentLatitude;
  double? currentLongitude;

  void changeChooseWhatLocation(String newChooseWhatLocation) {
    //chooseWhatLocation = newChooseWhatLocation;
    update([GetBuildersIdsConstants.chooseLocationOnMapCurrentAddress]);
  }

  bool isMapCameraMoving = false;

  Future<void> changeIsMapCameraMoving(bool newIsMapCameraMoving) async {
    if (isMapCameraMoving == newIsMapCameraMoving) return;
    isMapCameraMoving = newIsMapCameraMoving;

    if (isMapCameraMoving) {
      addressSearchController.clear();
      currentLatitude = null;
      currentLongitude = null;
    } else if (!isMapCameraMoving) {
      await getAddressFromCoordinates(currentLatitude!, currentLongitude!);
    }
    update([
      GetBuildersIdsConstants.chooseLocationOnMapGoogleMapsMoving,
      GetBuildersIdsConstants.chooseLocationOnMapCurrentAddress,
      GetBuildersIdsConstants.pickCurrentActionButton,
    ]);
  }

  GoogleMapController? googleMapsController;

  void updateGoogleMapsController(GoogleMapController mapController) {
    googleMapsController = mapController;
    if (Get.arguments != null) {
      if (Get.arguments['latitude'] != null && Get.arguments['longitude'] != null) {
        print('ok');
        changeStartingPosition(
          Position(
            latitude: Get.arguments['latitude'],
            longitude: Get.arguments['longitude'],
            timestamp: DateTime.now(),
            headingAccuracy: 0,
            altitudeAccuracy: 0,
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            floor: 0,
          ),
        );
      }
    }
  }

  CameraPosition? initialGoogleMapsCameraPosition;

  void changeInitialGoogleMapsCameraPosition(CameraPosition newCameraPosition) {
    initialGoogleMapsCameraPosition = newCameraPosition;
  }

  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    await GeocodingService.getPlaceMarkFromCoordinates(lat, lng).then((value) {
      if (value != null) {
        addressSearchController.text = value;
        update([
          GetBuildersIdsConstants.pickCurrentActionButton,
        ]);
      }
    });
  }

  Position? selectedPosition;

  Future<void> changeStartingPosition(Position? newPosition, {bool? withoutGetPlace}) async {
    selectedPosition = newPosition;
    if (newPosition != null) {
      changeInitialGoogleMapsCameraPosition(CameraPosition(
        target: LatLng(selectedPosition!.latitude!, selectedPosition!.longitude!),
        zoom: 14,
      ));
      googleMapsController
          ?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(selectedPosition!.latitude!, selectedPosition!.longitude!), 14));
      if (withoutGetPlace == null || !withoutGetPlace) {
        getAddressFromCoordinates(selectedPosition!.latitude!, selectedPosition!.longitude!);
      } else {}
    }
  }

  bool getCurrentPositionLoading = false;

  void changeGetCurrentPositionLoading(bool newGetCurrentPositionLoading) {
    getCurrentPositionLoading = newGetCurrentPositionLoading;
    update([GetBuildersIdsConstants.pickCurrentLocationButton]);
  }

  Future<void> enableAndGetStartingPositionFromGeolocator() async {
    Position? newPosition = await GeolocatorLocationService.getCurrentLocation(
      onLoading: () {
        changeGetCurrentPositionLoading(true);
      },
      onFinal: () {
        changeGetCurrentPositionLoading(false);
      },
    );
    if (newPosition != null) {
      changeStartingPosition(newPosition);
    }
  }

  bool getPlaceSuggestionsLoading = false;
  void changeGetPlaceSuggestionsLoading(bool newGetPlaceSuggestionsLoading) {
    getPlaceSuggestionsLoading = newGetPlaceSuggestionsLoading;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions]);
  }

  bool showPlacesSuggestions = false;
  void changeShowPlacesSuggestions(bool newShowPlacesSuggestions) {
    showPlacesSuggestions = newShowPlacesSuggestions;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions]);
  }

  List<PlacesSearchResult> placesSuggestions = [];
  void changePlacesSuggestions(List<PlacesSearchResult> newPlacesSuggestions) {
    placesSuggestions = newPlacesSuggestions;
    update([GetBuildersIdsConstants.chooseLocationOnMapPlacesSuggestions, GetBuildersIdsConstants.pickCurrentActionButton]);
  }

  void getPlacesSuggestions(String searchText) async {
    changeGetPlaceSuggestionsLoading(true);
    changeShowPlacesSuggestions(true);
    changePlacesSuggestions(await GeocodingService.getPlacesSuggestionsFromText(searchText));
    changeGetPlaceSuggestionsLoading(false);
  }

  String? selectedPlaceTitle;
  String? selectedPlaceFormattedAddress;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum MarkersIds {
  chosenLocationMarkerId,
}
