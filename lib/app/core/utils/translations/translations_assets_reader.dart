//create a class that will read the json file and return a map
import 'dart:convert';

import 'package:flutter/services.dart';

abstract class TranslationsAssetsReader {
  static Map<String, String>? ar;
  static Map<String, String>? en;
  static Map<String, String>? fr;
  static Future<void> initialize() async {
    //read the json file and return a map
    final responseAR = await rootBundle.loadString('assets/translations/ar.json');
    final responseEN = await rootBundle.loadString('assets/translations/en.json');
    final responseFR = await rootBundle.loadString('assets/translations/fr.json');
    ar = Map<String, String>.from(json.decode(responseAR));
    en = Map<String, String>.from(json.decode(responseEN));
    fr = Map<String, String>.from(json.decode(responseFR));
  }
}
