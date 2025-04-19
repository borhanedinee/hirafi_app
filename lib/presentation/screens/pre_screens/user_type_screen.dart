import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/pre_screens/artisan_signup_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_signup_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_login_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logos/logo1.png',
              width: size.width * 0.5,
              height: size.height * 0.3,
            ),

            // WELCOMING TEXT
            Text(
              'Welcome to Herrafi',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'Connecting artisans with clients for unique creations.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.greyColor),
            ),

            const SizedBox(height: 32),
            // USER TYPE BUTTONS
            _buildRegisterAsClientButton(context),
            const SizedBox(height: 10),
            _buildRegisterAsArtisanButton(context),

            const SizedBox(height: 20),

            // ALREADY HAVE AN ACCOUNT
            Text(
              'Already have an account?',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Login here',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  SizedBox _buildRegisterAsArtisanButton(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArtisanSignupScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          backgroundColor: AppColors.whiteColor.withValues(alpha: .8),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.brush,
              color: AppColors.primaryColor,
              size: 20,
            ),
            const SizedBox(width: 16),
            Text(
              'Register as Artisan',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildRegisterAsClientButton(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the client screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientSignupScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 16),
            Text(
              'Register as Client',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
