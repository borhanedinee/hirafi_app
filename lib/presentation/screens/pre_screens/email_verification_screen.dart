import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;

  const EmailVerificationScreen({
    Key? key,
    required this.email,
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
    final l10n = AppLocalizations.of(context)!;
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
                      Text(
                        l10n.emailVerificationScreen_checkEmail,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n
                            .emailVerificationScreen_sentCode(widget.email)
                            .replaceAll('{email}', widget.email),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.emailVerificationScreen_enterCode,
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
                          Text(
                            l10n.emailVerificationScreen_noCode,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.greyColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: Resend verification code
                              print('Resend code tapped');
                            },
                            child: Text(
                              l10n.emailVerificationScreen_resend,
                              style: const TextStyle(
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
                      Text(
                        l10n.emailVerificationScreen_getVerified,
                        style: const TextStyle(
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
                                  Get.find<GlobalDataController>().isArtisan!
                                      ? Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PackagesScreen(),
                                          ),
                                        )
                                      : Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NavBarRootScreen(),
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
                          child: Text(
                            l10n.emailVerificationScreen_verifyEmail,
                            style: const TextStyle(
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
