import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/artisan_sinup2_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/login_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_signup_screen/upload_document.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/utils/constants/wilayas_to_daira.dart';
import 'package:hirafi/utils/dummy_data.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisanSignupScreen extends StatefulWidget {
  const ArtisanSignupScreen({super.key});

  @override
  State<ArtisanSignupScreen> createState() => _ArtisanSignupScreenState();
}

class _ArtisanSignupScreenState extends State<ArtisanSignupScreen> {
  bool isLoading = false;
  // LISTS FROM DROP DOWN
  // SEX VALUES
  final List<String> _sexList = ['Male', 'Female'];
  String? _selectedSex;

  // CATEGORIES VALUES
  final List<String> _artisanCategoryServices = artisanServices.keys.toList();
  String? _selectedArtisanCategory;

  // SAERVICES OF THE SELECTED CATEGORY
  final List<String> _selectedServices = [];

  // _WILAYAS
  final List _wilayas = WILAYA_TO_DAIRA.map(
    (e) {
      return e['wilaya_name'];
    },
  ).toList();
  String? _selectedWilaya;

  // COMMUNE
  String? _selectedCommune;

  // ACCEPT TERMS CHECK BOX
  bool _checked = true;

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
                              l10n.artisanSignUp1Screen_completeRegistration,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(height: 16),

                          // SIGN UP PROCEDURE PROGRESS
                          Hero(
                            tag: 'progress',
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor:
                                  AppColors.greyColor.withOpacity(0.2),
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              minHeight: 8,
                            ),
                          ),

                          SizedBox(height: 16),

                          // ARTISAN INFORMATION
                          //UPLOAD PICTURE
                          _buildFieldHeading(
                            context,
                            headingText:
                                l10n.artisanSignUp1Screen_profilePicture,
                          ),
                          SizedBox(height: 8),
                          _buildUploadProfilePicture(context),
                          SizedBox(height: 16),
                          _buildFieldHeading(
                            headingText: l10n.artisanSignUp1Screen_firstName,
                            context,
                          ),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.artisanSignUp1Screen_firstNameHint,
                            prefixIcon: Icon(
                              Icons.person_2_rounded,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 22,
                            ),
                          ),

                          SizedBox(height: 16),
                          _buildFieldHeading(
                            headingText: l10n.artisanSignUp1Screen_secondName,
                            context,
                          ),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.artisanSignUp1Screen_secondNameHint,
                            prefixIcon: Icon(
                              Icons.person_2_rounded,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 22,
                            ),
                          ),

                          SizedBox(height: 16),

                          // Gender
                          _buildFieldHeading(context,
                              headingText: l10n.artisanSignUp1Screen_sex),
                          SizedBox(height: 8),
                          _buildSexDrowDownField(),
                          SizedBox(height: 16),

                          // Phone Number
                          _buildFieldHeading(context,
                              headingText:
                                  l10n.artisanSignUp1Screen_phoneNumber),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.artisanSignUp1Screen_phoneNumberHint,
                            prefixIcon: Icon(
                              FontAwesomeIcons.phone,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 18,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Phone Number
                          _buildFieldHeading(context,
                              headingText: l10n.artisanSignUp1Screen_email),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.artisanSignUp1Screen_emailHint,
                            prefixIcon: Icon(
                              FontAwesomeIcons.mailBulk,
                              color: AppColors.greyColor.withValues(alpha: .5),
                              size: 18,
                            ),
                          ),

                          SizedBox(height: 16),

                          // DATE OF BIRTH
                          _buildFieldHeading(
                            context,
                            headingText: l10n.artisanSignUp1Screen_dateOfBirth,
                          ),
                          SizedBox(height: 8),
                          _buildTextField(
                            context,
                            hintText: l10n.artisanSignUp1Screen_dateOfBirthHint,
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
                          _buildFieldHeading(context,
                              headingText: l10n.artisanSignUp1Screen_password),
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
                              headingText:
                                  l10n.artisanSignUp1Screen_confirmPassword),
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

                          SizedBox(height: 32),

                          Divider(
                            color: AppColors.blackColor.withValues(alpha: .6),
                          ),

                          SizedBox(height: 32),

                          // SELECT CATEGORY
                          _buildFieldHeading(context,
                              headingText:
                                  l10n.artisanSignUp1Screen_selectCategory),
                          SizedBox(height: 16),
                          _buildCategoryDrowDownField(),

                          SizedBox(height: 16),

                          // SELECT SERVICES OF SELECTED CATEGORY
                          _selectedArtisanCategory != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildFieldHeading(context,
                                        headingText: l10n
                                            .artisanSignUp1Screen_selectSubCategory),
                                    SizedBox(height: 8),
                                    _buildCategoryServicesDrowDownField(
                                        selectedCategory:
                                            _selectedArtisanCategory!),
                                  ],
                                )
                              : SizedBox(),

                          SizedBox(height: 16),

                          // SELECT WILAYA
                          _buildFieldHeading(context,
                              headingText:
                                  l10n.artisanSignUp1Screen_selectWilaya),
                          SizedBox(height: 16),
                          _buildWilayaDrowDownField(),

                          SizedBox(height: 16),

                          // SELECT COMMUNE
                          _selectedWilaya != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildFieldHeading(context,
                                        headingText: l10n
                                            .artisanSignUp1Screen_selectCommune),
                                    SizedBox(height: 16),
                                    _buildCommuneDrowDownField(
                                        selectedWilaya: _selectedWilaya!),
                                  ],
                                )
                              : SizedBox(),

                          SizedBox(height: 16),

                          // UPLOAD RESUME
                          _buildFieldHeading(context,
                              headingText: l10n
                                  .artisanSignUp1Screen_workLicenseCertificate),
                          SizedBox(height: 8),
                          _buildUploadCertificate(context),
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
                                        text: l10n
                                            .clientSignupPage_agreementPrefix,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.blackColor
                                                  .withValues(alpha: .7),
                                            ),
                                      ),
                                      TextSpan(
                                        text: l10n
                                            .artisanSignUp1Screen_termsOfService,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: l10n.clientSignupPage_and,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.blackColor
                                                  .withValues(alpha: .7),
                                            ),
                                      ),
                                      TextSpan(
                                        text: l10n
                                            .artisanSignUp1Screen_privacyPolicy,
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

                          SizedBox(
                            height: 32,
                          ),
                          _buildNextButton(),

                          SizedBox(height: 24),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 32,
                    ),

                    // LOGIN BUTTON
                    _buildAlreadyHaveAnAccount(context),
                    SizedBox(
                      height: 50,
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

  Row _buildAlreadyHaveAnAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.clientSignupPage_alreadyHaveAccount,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context)!.logIn,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        )
      ],
    );
  }

  Container _buildUploadProfilePicture(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        dashPattern: const [4, 4], // Dashed pattern: 4px dash, 4px gap
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.greyColor.withValues(alpha: .1),
              child: Icon(
                Icons.person_2_rounded,
                color: AppColors.greyColor.withValues(alpha: .2),
                size: 50,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: size.width * .45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .artisanSignUp1Screen_uploadPicture,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildUploadCertificate(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DottedUploadDocument(
        documentTypeIcon: Icon(
          Icons.upload_file,
          color: AppColors.greyColor.withValues(alpha: .7),
        ),
        descriptionText: AppLocalizations.of(context)!
            .artisanSignUp1Screen_uploadCertificateDescription,
        infoText: AppLocalizations.of(context)!
            .artisanSignUp1Screen_uploadCertificateInfo,
        uploadButtonText:
            AppLocalizations.of(context)!.artisanSignUp1Screen_uploadDocument,
      ),
    );
  }

  Center _buildNextButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to the client screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArtisanSignupTwoScreen(),
              ),
            );
            isLoading = false;
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.artisanSignUp1Screen_next),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.navigate_next,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSexDrowDownField() {
    return DropdownButtonFormField<String>(
      value: _selectedSex,
      hint: Text(
        AppLocalizations.of(context)!.artisanSignUp1Screen_sexHint,
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: AppLocalizations.of(context)!.clientSignupPage_sexHint,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.greyColor.withValues(alpha: 0.2)),
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
        return null;
      },
    );
  }

  Widget _buildCategoryDrowDownField() {
    return DropdownButtonFormField<String>(
      value: _selectedArtisanCategory,
      hint: Text(
        AppLocalizations.of(context)!.artisanSignUp1Screen_categoryHint,
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText:
            AppLocalizations.of(context)!.artisanSignUp1Screen_categoryHint,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.greyColor.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _artisanCategoryServices.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(
            category,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedServices.clear();
          _selectedArtisanCategory = value;
        });
      },
      validator: (value) {
        return null;
      },
    );
  }

  Widget _buildCategoryServicesDrowDownField(
      {required String selectedCategory}) {
    return // Custom Dropdown with Checkboxes
        GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withValues(alpha: .05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.greyColor.withValues(alpha: 0.2),
          ),
        ),
        child: PopupMenuButton<String>(
          offset: const Offset(0, 50), // Position the popup below the field
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {
            // This is handled by the checkbox onTap, so we don't need onSelected
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                enabled:
                    false, // Disable default tap behavior for the entire menu
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setMenuState) {
                    return Container(
                      constraints: const BoxConstraints(
                        maxHeight: 200, // Limit height for scrollable list
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              artisanServices[selectedCategory]!.map((service) {
                            return CheckboxListTile(
                              value: _selectedServices.contains(service),
                              title: Text(
                                service,
                                style: const TextStyle(fontSize: 14),
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedServices.add(service);
                                  } else {
                                    _selectedServices.remove(service);
                                  }
                                });
                                setMenuState(() {}); // Update the menu UI
                              },
                              activeColor: AppColors.primaryColor,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ];
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedServices.isEmpty
                    ? AppLocalizations.of(context)!
                        .artisanSignUp1Screen_services
                    : '${_selectedServices.length} service${_selectedServices.length == 1 ? '' : 's'} selected',
                style: TextStyle(
                  color: _selectedServices.isEmpty
                      ? AppColors.greyColor
                      : AppColors.blackColor,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWilayaDrowDownField() {
    return DropdownButtonFormField<String>(
      value: _selectedWilaya,
      hint: Text(
        AppLocalizations.of(context)!.artisanSignUp1Screen_wilayaHint,
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText:
            AppLocalizations.of(context)!.artisanSignUp1Screen_wilayaHint,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.greyColor.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _wilayas.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedWilaya = value;
        });
      },
      validator: (value) {
        return null;
      },
    );
  }

  Widget _buildCommuneDrowDownField({required String selectedWilaya}) {
    final List<String> _dayras = WILAYA_TO_DAIRA.firstWhere(
      (e) => e['wilaya_name'] == selectedWilaya,
      orElse: () => {'daira_names': []}, // Return an empty list if no match
    )['daira_names'] as List<String>;

    return DropdownButtonFormField<String>(
      value: _selectedCommune,
      hint: Text(
        AppLocalizations.of(context)!.artisanSignUp1Screen_communeHint,
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText:
            AppLocalizations.of(context)!.artisanSignUp1Screen_communeHint,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.greyColor.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _dayras.map((dayra) {
        return DropdownMenuItem<String>(
          value: dayra,
          child: Text(dayra),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCommune = value;
        });
      },
      validator: (value) {
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
