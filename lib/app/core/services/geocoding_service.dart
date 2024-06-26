import 'dart:developer';

import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_maps_webservices/geocoding.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:get/get.dart';
import 'package:flutter_google_maps_webservices/src/core.dart' as googleMapsWebServices;

class GeocodingService {
  static Future<String?> getPlaceMarkFromCoordinates(double lat, double lng) async {
    final places = GoogleMapsGeocoding(apiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'));
    GeocodingResponse response = await places.searchByLocation(googleMapsWebServices.Location(lat: lat, lng: lng));

    log('error message::: ${response.errorMessage}');

    response.results.first.addressComponents.forEach((element) {
      log('address component::: ${element.toJson()}');
    });

    //log('full address json::: ${response.results.first.toJson()}');

    return response.results.first.formattedAddress;
  }

  static Future<List<PlacesSearchResult>> getPlacesSuggestionsFromText(String searchText) async {
    final places = GoogleMapsPlaces(apiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'));
    PlacesSearchResponse response = await places.searchByText(searchText, language: Get.locale?.languageCode);
    return response.results;
  }
}
