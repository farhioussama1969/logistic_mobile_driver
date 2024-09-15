import 'dart:async';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GeolocatorLocationService {
  static PermissionStatus? permission;

  static StreamSubscription<LocationData>? streamSubscription;

  static Future<Position?> getCurrentLocation({
    Function? onLoading,
    Function? onFinal,
  }) async {
    try {
      if (onLoading != null) onLoading();
      if (await checkServiceLocationPermission()) {
        LocationData locationData = await Location().getLocation();
        if (onFinal != null) onFinal();

        return Position(
            longitude: locationData.longitude!,
            latitude: locationData.latitude!,
            timestamp: DateTime.now(),
            accuracy: locationData.accuracy!,
            altitude: locationData.altitude!,
            altitudeAccuracy: 0,
            heading: locationData.heading!,
            headingAccuracy: locationData.headingAccuracy!,
            speed: locationData.speed!,
            speedAccuracy: locationData.speedAccuracy!);
      } else {
        await Location().requestService();
        LocationData locationData = await Location().getLocation();
        if (onFinal != null) onFinal();

        return Position(
            longitude: locationData.longitude!,
            latitude: locationData.latitude!,
            timestamp: DateTime.now(),
            accuracy: locationData.accuracy!,
            altitude: locationData.altitude!,
            altitudeAccuracy: 0,
            heading: locationData.heading!,
            headingAccuracy: locationData.headingAccuracy!,
            speed: locationData.speed!,
            speedAccuracy: locationData.speedAccuracy!);
      }
    } catch (e) {}

    return null;
  }

  static double calculateDistanceBetweenTwoPoints(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static Future<bool> getServiceLocationAvailability() async {
    print(
        'locatiion serice avaialablity::: ${await Location().serviceEnabled()}');
    return await Location().serviceEnabled();
  }

  static StreamSubscription<ServiceStatus>? serviceLocationAvailabilityStream;

  static void checkServiceLocationAvailability(
      {required Function onServiceAvailable,
      required Function onServiceUnavailable}) {
    serviceLocationAvailabilityStream = Geolocator.getServiceStatusStream()
        .listen((ServiceStatus status) async {
      if (status == ServiceStatus.enabled &&
          await checkServiceLocationPermission()) {
        onServiceAvailable();
      } else {
        onServiceUnavailable();
      }
    });
  }

  static Future<bool> checkServiceLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) ;
      return false;
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static LatLng calculatePolylineCenter(
      {required Polyline polyline, required int pointsCount}) {
    double lat = 0;
    double lon = 0;

    if (polyline.points.length < pointsCount) {
      for (var i = 0; i < polyline.points.length; i++) {
        lat += polyline.points[i].latitude;
        lon += polyline.points[i].longitude;
      }
    } else {
      lat = polyline.points[0].latitude +
          polyline.points[polyline.points.length - 1].latitude;
      lon = polyline.points[0].longitude +
          polyline.points[polyline.points.length - 1].longitude;

      int jumpingValue = polyline.points.length ~/ pointsCount;

      for (var i = 1; i < polyline.points.length; i += jumpingValue) {
        if (i != polyline.points.length - 1) {
          lat += polyline.points[i].latitude;
          lon += polyline.points[i].longitude;
        }
      }
    }
    return LatLng(lat / polyline.points.length, lon / polyline.points.length);
  }
}
