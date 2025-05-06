import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/screens/pre_screens/artisan_signup_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_signup_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/login_screen.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section with a subtle container
                Hero(
                  tag: 'logo-animation',
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logos/logo1.png',
                      width: size.width * 0.5,
                      height: size.height * 0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Welcoming Text with Improved Hierarchy
                Text(
                  AppLocalizations.of(context)!.userTypeWelcomeTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        fontSize: 28,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.userTypeSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.greyColor.withOpacity(0.8),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // User Type Buttons
                _buildRegisterAsClientButton(context),
                const SizedBox(height: 16),
                _buildRegisterAsArtisanButton(context),
                const SizedBox(height: 32),

                // Divider for Visual Separation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: AppColors.greyColor.withOpacity(0.3),
                    thickness: 1,
                  ),
                ),
                const SizedBox(height: 16),

                // Already Have an Account Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.haveAccount,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.logIn,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildRegisterAsClientButton(BuildContext context) {
    return SizedBox(
      width: size.width * 0.85,
      child: ElevatedButton(
        onPressed: () {
          Get.find<GlobalDataController>().isArtisan = false;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientSignupScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: AppColors.primaryColor.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              AppLocalizations.of(context)!.registerAsClient,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildRegisterAsArtisanButton(BuildContext context) {
    return SizedBox(
      width: size.width * 0.85,
      child: ElevatedButton(
        onPressed: () {
          Get.find<GlobalDataController>().isArtisan = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArtisanSignupScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
          ),
          elevation: 5,
          shadowColor: AppColors.greyColor.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work,
              color: AppColors.primaryColor,
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              AppLocalizations.of(context)!.registerAsArtisan,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
