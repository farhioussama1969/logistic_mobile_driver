import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';

class TranslationUtil {
  static Locale? currentLang = const Locale('ar');

  static void changeLang({required String lang}) {
    LocalStorageService.saveData(key: StorageKeysConstants.localeLang, value: lang, type: DataTypes.string);
    Get.updateLocale(Locale(lang));
    currentLang = Locale(lang);
  }

  static Future<void> initialize() async {
    if (await LocalStorageService.loadData(key: StorageKeysConstants.localeLang, type: DataTypes.string) != null) {
      currentLang = Locale(await LocalStorageService.loadData(key: StorageKeysConstants.localeLang, type: DataTypes.string));
    }
    await initializeIntlDateFormatTranslation();
  }

  static Future<void> initializeIntlDateFormatTranslation() async {
    initializeDateFormatting();
    Intl.systemLocale = await findSystemLocale();
    Intl.defaultLocale = 'ar';
  }
}
