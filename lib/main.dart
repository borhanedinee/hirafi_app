import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hirafi/app_bindings.dart';
import 'package:hirafi/presentation/controller/locale_controller.dart';
import 'package:hirafi/presentation/screens/pre_screens/splash_screen.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/user_type_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}

late Size size;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LocaleController>(
      () => LocaleController(),
      fenix: true,
    );
    size = MediaQuery.of(context).size;
    return GetMaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialBinding: AppBindings(),
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Get.find<LocaleController>().locale, // Default locale
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      home: GetBuilder<LocaleController>(
        builder: (controller) => SplashScreen(),
      ),
    );
  }
}
