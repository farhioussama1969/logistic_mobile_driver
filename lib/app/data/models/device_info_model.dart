import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoModel {
  OsTypes? osType;
  String? deviceId;
  IosDeviceInfo? iosDeviceInfo;
  AndroidDeviceInfo? androidDeviceInfo;

  DeviceInfoModel({this.osType,this.deviceId,this.androidDeviceInfo,this.iosDeviceInfo});

}

enum OsTypes { android, ios }
