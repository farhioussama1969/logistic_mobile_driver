import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';

class ThemeUtil {
  static ThemeMode currentTheme = ThemeMode.light;

  static bool isDarkMode = false;

  static void changeTheme({required ThemeMode theme}) {
    LocalStorageService.saveData(
        key: StorageKeysConstants.localeTheme, value: (theme == ThemeMode.dark) ? 'dark' : 'light', type: DataTypes.string);
    isDarkMode = theme == ThemeMode.dark;
    Get.changeThemeMode(theme);
    currentTheme = theme;
  }

  static Future<void> initialize() async {
    if (await LocalStorageService.loadData(key: StorageKeysConstants.localeTheme, type: DataTypes.string) != null) {
      isDarkMode = await LocalStorageService.loadData(key: StorageKeysConstants.localeTheme, type: DataTypes.string) == 'dark';
      currentTheme = (await LocalStorageService.loadData(key: StorageKeysConstants.localeTheme, type: DataTypes.string) == 'dark')
          ? ThemeMode.dark
          : ThemeMode.light;
      if (currentTheme == ThemeMode.dark) {
        isDarkMode = true;
      } else {
        isDarkMode = false;
      }
    } else {
      isDarkMode = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    }
    print('isDarkMode: $isDarkMode');
  }
}
