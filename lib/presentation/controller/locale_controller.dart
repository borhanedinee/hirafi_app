import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // Reactive locale variable (default to Arabic)
  Locale? locale;

  // Set new locale and save it
  Future<void> setLocale(Locale newLocale) async {
    if (locale == newLocale) return; // No change needed
    // Update the app's locale
    update();
  }
}
