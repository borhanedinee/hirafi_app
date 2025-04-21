import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/client_screens/posted_offer_screen.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/login_screen.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class ClientSignupScreen extends StatefulWidget {
  ClientSignupScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignupScreen> createState() => _ClientSignupScreenState();
}

class _ClientSignupScreenState extends State<ClientSignupScreen> {
  bool isLoading = false;

  final List<String> _sexList = [
    'Male',
    'Female',
  ];

  String? _selectedSex;
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 80),

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
                            'Client Registration',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        SizedBox(height: 16),
                        MyFieldHeader(
                          headingText: 'Full name',
                        ),
                        SizedBox(height: 8),
                        MyTextField(
                          hintText: 'Enter your full name',
                          prefixIcon: Icon(
                            Icons.person_2_rounded,
                            color: AppColors.greyColor.withValues(alpha: .5),
                            size: 22,
                          ),
                        ),

                        SizedBox(height: 16),

                        // Gender
                        MyFieldHeader(headingText: 'Sex'),
                        SizedBox(height: 8),
                        _buildSexDropdownField(),
                        SizedBox(height: 16),

                        // Phone Number
                        MyFieldHeader(headingText: 'Phone Number'),
                        SizedBox(height: 8),
                        MyTextField(
                          hintText: '+213',
                          prefixIcon: Icon(
                            FontAwesomeIcons.phone,
                            color: AppColors.greyColor.withValues(alpha: .5),
                            size: 18,
                          ),
                        ),

                        SizedBox(height: 16),

                        // EMAIL ADDRESS
                        MyFieldHeader(headingText: 'Email address'),
                        SizedBox(height: 8),
                        MyTextField(
                          hintText: 'email@exemple.com',
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColors.greyColor.withValues(alpha: .5),
                            size: 20,
                          ),
                        ),

                        SizedBox(height: 16),

                        // DATE OF BIRTH
                        MyFieldHeader(
                          headingText: 'Date of birth',
                        ),
                        SizedBox(height: 8),
                        MyTextField(
                          hintText: 'DD/MM/YYY',
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: AppColors.greyColor.withValues(alpha: .5),
                            size: 20,
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),

                        SizedBox(height: 16),

                        // DATE OF BIRTH
                        MyFieldHeader(headingText: 'Password'),
                        SizedBox(height: 8),
                        MyTextField(
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

                        SizedBox(height: 16),

                        // DATE OF BIRTH
                        MyFieldHeader(headingText: 'Confirm password'),
                        SizedBox(height: 8),
                        MyTextField(
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

                        SizedBox(height: 16),

                        // DATE OF BIRTH
                        MyFieldHeader(
                            headingText: 'Additional information ( optional )'),
                        SizedBox(height: 8),
                        MyTextField(
                          hintText: 'Tell us a bit about your self...',
                          maxLines: 3,
                        ),

                        SizedBox(height: 16),

                        // AGREEMENETTO TERMS AND CONDITIONS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Checkbox(
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = value!;
                                });
                              },
                            ),
                            SizedBox(
                              width: size.width * .7,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.blackColor
                                                .withValues(alpha: .7),
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'and ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.blackColor
                                                .withValues(alpha: .7),
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24),

                        _buildCreateButton(),

                        SizedBox(height: 16),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 32,
                  ),

                  // LOGIN BUTTON
                  _buildAlreayHaveAnAcount(context),
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
    );
  }

  Row _buildAlreayHaveAnAcount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?'),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '  Sign in',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        )
      ],
    );
  }

  Center _buildCreateButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => PostedSuccessfully(
                  actionButtonText: 'Login Now',
                  description:
                      '“You’re all set! Discover the best artisans and enjoy top-quality services.”',
                  title: 'Signed Up Successfully',
                  onActionPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => route.isFirst,
                    );
                  },
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: Text('Register as Client'),
        ),
      ),
    );
  }

  Widget _buildSexDropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedSex,
      hint: const Text(
        'Select Category',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Choose your gender',
        labelStyle: const TextStyle(color: AppColors.greyColor),
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
      ),
      items: _sexList.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedSex = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
