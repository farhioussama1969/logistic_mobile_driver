import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/services/app_version_info_service.dart';
import 'package:loogisti/app/core/services/geocoding_service.dart';
import 'package:loogisti/app/core/services/geolocator_location_service.dart';
import 'package:loogisti/app/core/utils/translation_util.dart';
import 'package:loogisti/app/data/models/general_settings_model.dart';
import 'package:loogisti/app/data/providers/loogistic_api/config_provider.dart';

class ConfigController extends GetxController {
  String? appVersion;

  Future<void> getPackageVersion() async {
    appVersion = await AppVersionInfoService.getAppVersion();
    update([GetBuildersIdsConstants.splashVersionText]);
  }

  initialize() async {
    await getPackageVersion();
    enableAndGetStartingPositionFromGeolocator();
    //await getGeneralSettingsData();
  }

  String selectedAppLang = Get.locale?.languageCode ?? 'ar';

  bool saveAppLangLoading = false;

  void changeSaveAppLangLoading(bool loading) {
    saveAppLangLoading = loading;
    update([GetBuildersIdsConstants.profileAppLangWindowButton]);
  }

  void changeSelectedAppLang(String lang) {
    selectedAppLang = lang;
    update([GetBuildersIdsConstants.profileAppLangWindowList]);
  }

  String? currentAddress;
  void changeCurrentAddress(String newCurrentAddress) {
    currentAddress = newCurrentAddress;
    update([GetBuildersIdsConstants.currentUserAddress]);
  }

  Position? selectedPosition;

  Future<void> enableAndGetStartingPositionFromGeolocator() async {
    Position? newPosition = await GeolocatorLocationService.getCurrentLocation(
      onLoading: () {},
      onFinal: () {},
    );
    if (newPosition != null) {
      changeStartingPosition(newPosition);
    }
  }

  Future<void> changeStartingPosition(Position? newPosition, {bool? withoutGetPlace}) async {
    selectedPosition = newPosition;
    if (newPosition != null) {
      getAddressFromCoordinates(selectedPosition!.latitude!, selectedPosition!.longitude!);
    }
  }

  Future<void> getAddressFromCoordinates(double lat, double lng) async {
    await GeocodingService.getPlaceMarkFromCoordinates(lat, lng).then((value) {
      if (value != null) {
        changeCurrentAddress(value);
        update([
          GetBuildersIdsConstants.currentUserAddress,
        ]);
      }
    });
  }

  void saveAppLang() {
    TranslationUtil.changeLang(lang: selectedAppLang);
    //AuthProvider().updateProfile(onLoading: () {}, onFinal: () {});
    // Get.find<HomeController>().refreshHome();
    Get.back();
  }
}
