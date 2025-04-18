import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/client_login_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_signup/upload_document.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/constants/wilayas_to_daira.dart';
import 'package:hirafi/utils/dummy_data.dart';

class ArtisanSignupScreen extends StatefulWidget {
  const ArtisanSignupScreen({super.key});

  @override
  State<ArtisanSignupScreen> createState() => _ArtisanSignupScreenState();
}

class _ArtisanSignupScreenState extends State<ArtisanSignupScreen> {
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
                          'Artisan Registration',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // ARTISAN INFORMATION
                      //UPLOAD PICTURE
                      _buildFieldHeading(
                        context,
                        headingText: 'Profile Picture*',
                      ),
                      SizedBox(height: 8),
                      _buildUploadProfilePicture(context),
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
                      _buildSexDrowDownField(),
                      SizedBox(height: 16),

                      // Phone Number
                      _buildFieldHeading(context,
                          headingText: 'Phone Number or Email'),
                      SizedBox(height: 8),
                      _buildTextField(
                        context,
                        hintText: 'Enter phone number or email',
                        prefixIcon: Icon(
                          FontAwesomeIcons.phone,
                          color: AppColors.greyColor.withValues(alpha: .5),
                          size: 18,
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

                      Divider(
                        color: AppColors.blackColor.withValues(alpha: .6),
                      ),

                      SizedBox(height: 16),

                      // SELECT CATEGORY
                      _buildFieldHeading(context,
                          headingText: 'Select Category*'),
                      SizedBox(height: 8),
                      _buildCategoryDrowDownField(),

                      SizedBox(height: 16),

                      // SELECT SERVICES OF SELECTED CATEGORY
                      _selectedArtisanCategory != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldHeading(context,
                                    headingText: 'Select Sub Category*'),
                                SizedBox(height: 8),
                                _buildCategoryServicesDrowDownField(
                                    selectedCategory:
                                        _selectedArtisanCategory!),
                              ],
                            )
                          : SizedBox(),

                      SizedBox(height: 16),

                      // SELECT CATEGORY
                      _buildFieldHeading(context,
                          headingText: 'Select Wilaya *'),
                      SizedBox(height: 8),
                      _buildWilayaDrowDownField(),

                      SizedBox(height: 16),

                      // SELECT SERVICES OF SELECTED CATEGORY
                      _selectedWilaya != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldHeading(context,
                                    headingText: 'Select Commune *'),
                                SizedBox(height: 8),
                                _buildCommuneDrowDownField(
                                    selectedWilaya: _selectedWilaya!),
                              ],
                            )
                          : SizedBox(),

                      SizedBox(height: 16),

                      // UPLOAD RESUME
                      _buildFieldHeading(context,
                          headingText: 'Work License/Certificate (optiona)'),
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

  Container _buildUploadProfilePicture(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
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
                    'Upload Picture',
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
      child: UploadLicenseWidget(),
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

  Widget _buildSexDrowDownField() {
    return DropdownButtonFormField<String>(
      value: _selectedSex,
      hint: Text(
        'Sex',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Select your gender',
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
        'Category',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Select your craft',
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
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
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
                    ? 'Services'
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
        'Wilaya',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Select your wilaya',
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

    print('borhaaan + $_dayras');
    print('borhaaan + $selectedWilaya');
    return DropdownButtonFormField<String>(
      value: _selectedCommune,
      hint: Text(
        'Commune',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Select your commune',
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
