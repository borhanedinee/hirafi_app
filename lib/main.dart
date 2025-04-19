import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirafi/presentation/screens/pre_screens/splash_screen.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/user_type_screen.dart';

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
    size = MediaQuery.of(context).size;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
