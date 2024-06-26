import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static Future<void> saveData({required String key, required value, required DataTypes type}) async {
    if (type != DataTypes.listOfString && type != DataTypes.map) {
      await const FlutterSecureStorage().write(key: key, value: value.toString());
    } else if (type == DataTypes.map) {
      await const FlutterSecureStorage().write(key: key, value: jsonEncode(value));
    } else if (type == DataTypes.listOfString) {
      await const FlutterSecureStorage().write(key: key, value: jsonEncode(value));
    }
  }

  static Future loadData({
    required String key,
    required DataTypes type,
  }) async {
    String? value = await const FlutterSecureStorage().read(key: key);
    if (value != null) {
      if (type == DataTypes.int) return int.parse(value);
      if (type == DataTypes.double) return double.parse(value);
      if (type == DataTypes.string) return value;
      if (type == DataTypes.bool) return value.toLowerCase() == 'true';
      if (type == DataTypes.listOfString) return List<String>.from(jsonDecode(value));
      if (type == DataTypes.map) return jsonDecode(value);
    } else {
      return null;
    }
  }

  static deleteData({required String key}) {
    const FlutterSecureStorage().delete(key: key);
  }
}

enum DataTypes {
  int,
  double,
  string,
  bool,
  listOfString,
  map,
}
