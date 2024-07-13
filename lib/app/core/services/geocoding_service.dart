import 'dart:developer';

import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_maps_webservices/geocoding.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:get/get.dart';
import 'package:flutter_google_maps_webservices/src/core.dart' as googleMapsWebServices;

class GeocodingService {
  static Future<String?> getPlaceMarkFromCoordinates(double lat, double lng) async {
    final places = GoogleMapsGeocoding(apiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'));
    GeocodingResponse response = await places.searchByLocation(
      googleMapsWebServices.Location(lat: lat, lng: lng),
      language: 'ar_DZ',
    );

    log('error message::: ${response.errorMessage}');

    response.results.first.addressComponents.forEach((element) {
      log('address component::: ${element.toJson()}');
    });

    //log('full address json::: ${response.results.first.toJson()}');

    List<String>? addressComponents = response.results.first.formattedAddress?.split(',');

    addressComponents?.removeAt(0);

    print('geocoding::: {${addressComponents?.join(',').trim()}}');

    return addressComponents?.join(',').trim();

    // return '${response.results.first.addressComponents[1].longName}, ${response.results.first.addressComponents[2].longName}, ${response.results.first.addressComponents[3].longName} ,${response.results.first.addressComponents[4].longName}';
  }

  static Future<List<PlacesSearchResult>> getPlacesSuggestionsFromText(String searchText) async {
    final places = GoogleMapsPlaces(apiKey: FlutterConfig.get('GOOGLE_MAPS_API_KEY'));
    PlacesSearchResponse response = await places.searchByText(searchText, language: Get.locale?.languageCode);
    return response.results;
  }
}
