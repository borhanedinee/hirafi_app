import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_login_screen.dart';
import 'package:hirafi/presentation/widgets/my_header.dart';
import 'package:hirafi/utils/app_colors.dart';

class ClientSignupScreen extends StatefulWidget {
  ClientSignupScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignupScreen> createState() => _ClientSignupScreenState();
}

class _ClientSignupScreenState extends State<ClientSignupScreen> {
  final List<String> _sexList = [
    'Male',
    'Female',
  ];

  String? _selectedSex;
  bool _checked = true;

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
                          'Client Sign up',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildFieldHeading(
                        headingText: 'Full name',
                        context,
                      ),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
                        hintText: 'Enter your full name',
                        prefixIcon: Icon(
                          Icons.person_2_rounded,
                          color: AppColors.greyColor.withValues(alpha: .5),
                          size: 22,
                        ),
                      ),

                      SizedBox(height: 16),

                      // Gender
                      _buildFieldHeading(context, headingText: 'Sex'),
                      SizedBox(height: 8),
                      _buildSexDropdownField(),
                      SizedBox(height: 16),

                      // Phone Number
                      _buildFieldHeading(context, headingText: 'Phone Number'),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
                        hintText: '+213',
                        prefixIcon: Icon(
                          FontAwesomeIcons.phone,
                          color: AppColors.greyColor.withValues(alpha: .5),
                          size: 18,
                        ),
                      ),

                      SizedBox(height: 16),

                      // EMAIL ADDRESS
                      _buildFieldHeading(context, headingText: 'Email address'),
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
                      _buildFieldHeading(
                        context,
                        headingText: 'Date of birth',
                      ),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
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

                      SizedBox(height: 16),

                      // DATE OF BIRTH
                      _buildFieldHeading(context,
                          headingText: 'Confirm password'),
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

                      SizedBox(height: 16),

                      // DATE OF BIRTH
                      _buildFieldHeading(context,
                          headingText: 'Additional information ( optional )'),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ClientLoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        '  Sign in',
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

  Center _buildCreateButton() {
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
          child: Text('Create account'),
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
