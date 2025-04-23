import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart'; // Assuming AppColors is defined

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final bool isArtisan;

  const EmailVerificationScreen({
    Key? key,
    required this.email,
    required this.isArtisan,
  }) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String _otpCode = '';
  bool _isCodeValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 32,
                  ),

                  // Header Section
                  Column(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 60,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Check Your Email!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'We’ve sent a 6-digit code to ${widget.email}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter the code below to verify your email.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // OTP Input Section
                  Column(
                    children: [
                      OtpTextField(
                        numberOfFields: 6,
                        borderRadius: BorderRadius.circular(8),
                        fieldWidth: 40,
                        fieldHeight: 48,
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        borderColor: AppColors.greyColor,
                        focusedBorderColor: AppColors.primaryColor,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        onCodeChanged: (String code) {
                          setState(() {
                            _otpCode = code;
                            _isCodeValid = code.length == 6;
                          });
                        },
                        onSubmit: (String verificationCode) {
                          setState(() {
                            _otpCode = verificationCode;
                            _isCodeValid = true;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn’t receive the code? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.greyColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: Resend verification code
                              print('Resend code tapped');
                            },
                            child: const Text(
                              'Resend',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Action Button
                  Column(
                    children: [
                      const Text(
                        'Let’s get you verified and crafting!',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyColor,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isCodeValid
                              ? () {
                                  widget.isArtisan
                                      ? Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PackagesScreen(
                                              isArtisan: widget.isArtisan,
                                            ),
                                          ),
                                        )
                                      : Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NavBarRootScreen(
                                              isArtisan: widget.isArtisan,
                                            ),
                                          ),
                                        );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                            shadowColor:
                                AppColors.primaryColor.withOpacity(0.3),
                            disabledBackgroundColor:
                                AppColors.greyColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'Verify Email',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
