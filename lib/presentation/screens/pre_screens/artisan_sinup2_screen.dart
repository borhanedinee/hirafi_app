import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/client_screens/posted_offer_screen.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/email_verification_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/login_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_signup/upload_document.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ArtisanSignupTwoScreen extends StatefulWidget {
  const ArtisanSignupTwoScreen({super.key});

  @override
  State<ArtisanSignupTwoScreen> createState() => _ArtisanSignupTwoScreenState();
}

class _ArtisanSignupTwoScreenState extends State<ArtisanSignupTwoScreen> {
  // SAERVICES OF THE SELECTED CATEGORY
  final List<String> _weekDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  final List<String> _selectedDays = [];

  // ACCEPT TERMS CHECK BOX
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
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
                              'Complete your Registration as an Artisan',
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
                              value: 0.99,
                              backgroundColor:
                                  AppColors.greyColor.withOpacity(0.2),
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                              minHeight: 8,
                            ),
                          ),

                          SizedBox(height: 16),

                          MyFieldHeader(headingText: 'Working Days *'),
                          SizedBox(height: 8),
                          _buildWorkingDaysDrowDownField(),

                          SizedBox(height: 16),

                          // WORKING HOURS
                          ...List.generate(
                            _selectedDays.length,
                            (index) => WorkingHoursItem(
                              dayItem: _selectedDays[index],
                            ),
                          ).toList(),
                          SizedBox(
                            height: 16,
                          ),

                          _buildUploadIDCard(
                            context,
                            headingText: 'Front of your ID Card *',
                            uploadGuideText:
                                'Please upload a clear image of the front of your ID card.',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          _buildUploadIDCard(
                            context,
                            headingText: 'Back of your ID Card *',
                            uploadGuideText:
                                'Please upload a clear image of the back of your ID card.',
                          ),
                          SizedBox(
                            height: 16,
                          ),

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
                          SizedBox(
                            height: 32,
                          ),
                          _buildCreateNowButton(),

                          SizedBox(height: 24),
                        ],
                      ),
                    ),

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

  Container _buildUploadIDCard(BuildContext context,
      {required String headingText, required String uploadGuideText}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headingText,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          SizedBox(
            height: 8,
          ),
          DottedUploadDocument(
            descriptionText: uploadGuideText,
            documentTypeIcon: Icon(
              Icons.badge,
              color: AppColors.greyColor.withValues(alpha: .6),
            ),
            uploadButtonText: 'Upload Documment',
            infoText:
                'You can add this later, but it will appear as a notification in your profile',
          ),
        ],
      ),
    );
  }

  Center _buildCreateNowButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to the client screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EmailVerificationScreen(
                  email: 'boussahaborhanedine@gmail.com',
                  isArtisan: true,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: Text('Create Profile Now'),
        ),
      ),
    );
  }

  Widget _buildWorkingDaysDrowDownField() {
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
                          children: _weekDays.map((service) {
                            return CheckboxListTile(
                              value: _selectedDays.contains(service),
                              title: Text(
                                service,
                                style: const TextStyle(fontSize: 14),
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedDays.add(service);
                                  } else {
                                    _selectedDays.remove(service);
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
                _selectedDays.isEmpty
                    ? 'Select working days'
                    : '${_selectedDays.length} days${_selectedDays.length == 1 ? '' : 's'} selected',
                style: TextStyle(
                  color: _selectedDays.isEmpty
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
}

class WorkingHoursItem extends StatefulWidget {
  final String dayItem;

  const WorkingHoursItem({required this.dayItem, Key? key}) : super(key: key);

  @override
  _WorkingHoursItemState createState() => _WorkingHoursItemState();
}

class _WorkingHoursItemState extends State<WorkingHoursItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    // Start animation when widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size dynamically

    return FadeTransition(
      opacity: _opacityAnimation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.dayItem,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFieldHeader(
                      headingText: 'Start Time',
                      color: AppColors.greyColor.withOpacity(0.8),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: ((size.width - 32) / 2) - 40,
                      child: MyTextField(
                        hintText: 'eg. 9:00',
                        fillColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyFieldHeader(
                      headingText: 'End Time',
                      color: AppColors.greyColor.withOpacity(0.8),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: ((size.width - 32) / 2) - 40,
                      child: MyTextField(
                        hintText: 'eg. 16:00',
                        fillColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
