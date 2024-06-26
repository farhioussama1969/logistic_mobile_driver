import 'package:loogisti/app/core/constants/strings_assets_constants.dart';

class UnitConversionUtil {
  static String? distanceInTextFormat(int distanceInMeters) {
    if (distanceInMeters == 0) return null;
    if (distanceInMeters < 1000) {
      return '$distanceInMeters ${StringsAssetsConstants.meterUnit}';
    } else {
      return '${(distanceInMeters / 1000).toStringAsFixed(1)} ${StringsAssetsConstants.kilometerUnit}';
    }
  }

  static String? timeInTextFormat(int timeInSeconds) {
    if (timeInSeconds == 0) return null;
    if (timeInSeconds < 60) {
      return '$timeInSeconds ${StringsAssetsConstants.secondUnit}';
    } else if (timeInSeconds < 3600) {
      return '${(timeInSeconds / 60).toStringAsFixed(0)} ${StringsAssetsConstants.minuteUnit}';
    } else {
      return '${(timeInSeconds / 3600).toStringAsFixed(0)} ${StringsAssetsConstants.hourUnit} ${(timeInSeconds % 3600 / 60).toStringAsFixed(0)} ${StringsAssetsConstants.minuteUnit}';
    }
  }
}
