import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_signup_screen.dart';
import 'package:hirafi/utils/app_colors.dart';

class ClientLoginScreen extends StatefulWidget {
  ClientLoginScreen({Key? key}) : super(key: key);

  @override
  State<ClientLoginScreen> createState() => _ClientLoginScreenState();
}

class _ClientLoginScreenState extends State<ClientLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60),

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
                    color: AppColors.whiteColor,
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
                          'Client Login up',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // EMAIL ADDRESS
                      _buildFieldHeading(context, headingText: 'Phone Number'),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
                        hintText: 'email@exemple.com',
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.greyColor.withValues(alpha: .5),
                          size: 20,
                        ),
                      ),

                      SizedBox(height: 16),

                      // DATE OF BIRTH
                      _buildFieldHeading(context, headingText: 'Password'),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
                        hintText: '*********',
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
                            'Forgot password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: AppColors.primaryColor,
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

                // LOGIN BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ClientSignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        '  Sign up',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
        ),
      ),
    );
  }

  Center _buildLoginButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the client screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarRootScreen(
                  isArtisan: false,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: Text('Login'),
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
              color: AppColors.greyColor
                  .withOpacity(0.2), // Light grey for unfocused border
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
