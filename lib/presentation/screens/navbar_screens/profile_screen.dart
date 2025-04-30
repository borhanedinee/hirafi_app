import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/screens/client_screens/artisan_profile_details_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/prodile_views/artisan_profile_screen.dart';
import 'package:hirafi/presentation/screens/navbar_screens/prodile_views/client_profile_screen.dart';
import 'package:hirafi/utils/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          height: size.height,
          width: size.width,
          child: Get.find<GlobalDataController>().isArtisan!
              ? ArtisanProfileScreen()
              : ClientProfileScreen(),
        ),
      ),
    );
  }
}
