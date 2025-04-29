import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/artisan_signup_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_signup_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),

                    // LOGO
                    Image.asset(
                      'assets/images/logos/logo1.png',
                      height: 100,
                      width: 180,
                      fit: BoxFit.fill,
                    ),

                    SizedBox(height: 32),

                    Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.whiteColor,
                            AppColors.gradiantColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 7,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              l10n.loginScreen_logIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),

                          SizedBox(height: 16),

                          // PHONE NUMBER
                          _buildFieldHeading(context,
                              headingText: l10n.loginScreen_phoneNumber),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.loginScreen_emailHint,
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 20,
                            ),
                          ),

                          SizedBox(height: 16),

                          // PASSWORD
                          _buildFieldHeading(context,
                              headingText: l10n.loginScreen_password),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.loginScreen_passwordHint,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 20,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: AppColors.blackColor,
                              size: 20,
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                l10n.loginScreen_forgotPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),

                          _buildLoginButton(),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 32,
                    ),

                    // SIGN UP LINK
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.loginScreen_noAccount),
                        GestureDetector(
                          onTap: () {
                            _showRegistrationDialog(context);
                          },
                          child: Text(
                            l10n.loginScreen_signUp,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the registration dialog
  void _showRegistrationDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            l10n.loginScreen_register,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                title: Text(l10n.loginScreen_registerAsClient),
                onTap: () {
                  // Navigate to Client Registration Screen
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClientSignupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.work,
                  color: AppColors.primaryColor,
                ),
                title: Text(l10n.loginScreen_registerAsArtisan),
                onTap: () {
                  // Navigate to Artisan Registration Screen
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArtisanSignupScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }

  Center _buildLoginButton() {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            isLoading = true;
            setState(() {});
            Future.delayed(
              Duration(seconds: 2),
            );
            // Navigate to the client screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarRootScreen(
                  isArtisan: false,
                ),
              ),
            );
            isLoading = false;
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: isLoading
              ? Transform.scale(
                  scale: .5,
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  ),
                )
              : Text(l10n.loginScreen_logIn),
        ),
      ),
    );
  }

  Text _buildFieldHeading(
    BuildContext context, {
    required String headingText,
  }) {
    return Text(
      headingText,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColors.blackColor.withValues(alpha: .8),
            fontSize: 13,
          ),
    );
  }

  TextFormField _buildTextField(
    BuildContext context, {
    Widget? prefixIcon,
    Widget? suffixIcon,
    int? maxLines,
    required String hintText,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          fillColor: AppColors.greyColor.withValues(alpha: .05),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.greyColor.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintStyle: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
