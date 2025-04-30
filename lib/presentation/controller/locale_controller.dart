import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // Reactive locale variable (default to Arabic)
  Locale? locale;
  String? stringLanguage = 'English';

  // Set new locale and save it
  Future<void> setLocale(String selectedLanguage) async {
    stringLanguage = selectedLanguage;
    Locale? newLocale;
    switch (selectedLanguage.toLowerCase()) {
      case 'arabic':
        newLocale = Locale('ar');
        break;
      case 'french':
        newLocale = Locale('fr');
        break;
      case 'english':
        newLocale = Locale('en');
        break;
      default:
    }
    locale = newLocale;
    Get.updateLocale(newLocale!);
    update();
  }
}
