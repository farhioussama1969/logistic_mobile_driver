import 'package:loogisti/app/data/models/app_version_model.dart';

class GeneralSettingsModel {
  String? appName;
  String? policyUrl;
  String? termsUrl;
  String? aboutUsUrl;
  String? contactUsUrl;
  String? email;
  String? whatsapp;
  String? facebook;
  String? instagram;
  AppVersionModel? androidAppVersion;
  AppVersionModel? iosAppVersion;
  int? clientRideTimeout;
  int? clientRideMinDistance;
  int? driverSearchRadius;

  GeneralSettingsModel({
    this.appName,
    this.policyUrl,
    this.termsUrl,
    this.aboutUsUrl,
    this.email,
    this.whatsapp,
    this.facebook,
    this.instagram,
    this.androidAppVersion,
    this.iosAppVersion,
    this.clientRideTimeout,
    this.clientRideMinDistance,
    this.driverSearchRadius,
    this.contactUsUrl,
  });

  GeneralSettingsModel.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    policyUrl = json['policy_url'];
    termsUrl = json['terms_url'];
    aboutUsUrl = json['about_us_url'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    if (json['version'] != null) {
      iosAppVersion = json['version']['ios'] != null ? AppVersionModel.fromJson(json['version']['ios']) : null;
      androidAppVersion = json['version']['ios'] != null ? AppVersionModel.fromJson(json['version']['android']) : null;
    }
    clientRideTimeout = json['client_ride_timeout'] != null ? int.parse(json['client_ride_timeout'].toString()) : null;
    clientRideMinDistance = json['client_ride_min_distance'] != null ? int.parse(json['client_ride_min_distance'].toString()) : null;
    driverSearchRadius = json['driver_search_radius'] != null ? int.parse(json['driver_search_radius'].toString()) : null;
    contactUsUrl = json['contact_us_url'];
  }
}
