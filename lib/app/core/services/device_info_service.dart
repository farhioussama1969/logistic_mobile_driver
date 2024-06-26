import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:loogisti/app/data/models/device_info_model.dart';

class DeviceInfoService {
  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<DeviceInfoModel?> getDeviceInfo() async {
    DeviceInfoModel? deviceInfo;
    if (Platform.isIOS) {
      deviceInfo = DeviceInfoModel(
          osType: OsTypes.ios,
          deviceId: await MobileDeviceIdentifier().getDeviceId(),
          iosDeviceInfo: await deviceInfoPlugin.iosInfo,
          androidDeviceInfo: null);
    } else if (Platform.isAndroid) {
      deviceInfo = DeviceInfoModel(
          osType: OsTypes.android,
          deviceId: await MobileDeviceIdentifier().getDeviceId(),
          iosDeviceInfo: null,
          androidDeviceInfo: await deviceInfoPlugin.androidInfo);
    }
    return deviceInfo;
  }
}
