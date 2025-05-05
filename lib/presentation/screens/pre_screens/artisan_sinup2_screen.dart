import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/client_screens/posted_offer_screen.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/email_verification_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/login_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_signup_screen/upload_document.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisanSignupTwoScreen extends StatefulWidget {
  const ArtisanSignupTwoScreen({super.key});

  @override
  State<ArtisanSignupTwoScreen> createState() => _ArtisanSignupTwoScreenState();
}

class _ArtisanSignupTwoScreenState extends State<ArtisanSignupTwoScreen> {
  // SERVICES OF THE SELECTED CATEGORY
  late final List<String> _weekDays;
  final List<String> _selectedDays = [];
  bool _isWeekDaysInitialized = false;

  // ACCEPT TERMS CHECK BOX
  bool _checked = true;

  @override
  void initState() {
    super.initState();
    // Initialize _weekDays in didChangeDependencies instead
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isWeekDaysInitialized) {
      final l10n = AppLocalizations.of(context)!;
      _weekDays = [
        l10n.artisanSignUp2Screen_sunday,
        l10n.artisanSignUp2Screen_monday,
        l10n.artisanSignUp2Screen_tuesday,
        l10n.artisanSignUp2Screen_wednesday,
        l10n.artisanSignUp2Screen_thursday,
        l10n.artisanSignUp2Screen_friday,
        l10n.artisanSignUp2Screen_saturday,
      ];
      _isWeekDaysInitialized = true;
    }
  }

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
                              l10n.artisanSignUp2Screen_completeRegistration,
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

                          MyFieldHeader(
                              headingText:
                                  l10n.artisanSignUp2Screen_workingDays),
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
                            headingText: l10n.artisanSignUp2Screen_frontIdCard,
                            uploadGuideText:
                                l10n.artisanSignUp2Screen_frontIdCardGuide,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          _buildUploadIDCard(
                            context,
                            headingText: l10n.artisanSignUp2Screen_backIdCard,
                            uploadGuideText:
                                l10n.artisanSignUp2Screen_backIdCardGuide,
                          ),
                          SizedBox(
                            height: 16,
                          ),

                          // AGREEMENT TO TERMS AND CONDITIONS
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
                                        text: l10n.artisanSignUp2Screen_agreeTo,
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
                                            .artisanSignUp2Screen_termsOfService,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: l10n.artisanSignUp2Screen_and,
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
                                            .artisanSignUp2Screen_privacyPolicy,
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
    final l10n = AppLocalizations.of(context)!;
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
            uploadButtonText: l10n.artisanSignUp2Screen_uploadDocument,
            infoText: l10n.artisanSignUp2Screen_uploadInfo,
          ),
        ],
      ),
    );
  }

  Center _buildCreateNowButton() {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to the client screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EmailVerificationScreen(
                  email: 'faroukmn@gmail.com',
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.primaryColor,
            elevation: 2,
          ),
          child: Text(l10n.artisanSignUp2Screen_createProfileNow),
        ),
      ),
    );
  }

  Widget _buildWorkingDaysDrowDownField() {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
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
          offset: const Offset(0, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {},
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                enabled: false,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setMenuState) {
                    return Container(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
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
                                setMenuState(() {});
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
                    ? l10n.artisanSignUp2Screen_selectWorkingDays
                    : '${_selectedDays.length} ${l10n.artisanSignUp2Screen_day}${_selectedDays.length == 1 ? '' : 's'} selected',
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

  late TextEditingController startTimeController;
  late TextEditingController endTimeController;

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

    // Initialize text editing controllers
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

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
                      headingText: l10n.artisanSignUp2Screen_startTime,
                      color: AppColors.greyColor.withOpacity(0.8),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: ((size.width - 32) / 2) - 40,
                      child: MyTextField(
                        hintText: l10n.artisanSignUp2Screen_startTimeHint,
                        controller: startTimeController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            DatePicker.showTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (time) {
                                final formattedTime =
                                    DateFormat('HH:mm').format(time);
                                setState(() {
                                  startTimeController.text = formattedTime;
                                });
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                          icon: Icon(
                            LucideIcons.clock,
                            color: AppColors.greyColor.withOpacity(0.6),
                            size: 20,
                          ),
                        ),
                        fillColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyFieldHeader(
                      headingText: l10n.artisanSignUp2Screen_endTime,
                      color: AppColors.greyColor.withOpacity(0.8),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: ((size.width - 32) / 2) - 40,
                      child: MyTextField(
                        controller: endTimeController,
                        hintText: l10n.artisanSignUp2Screen_endTimeHint,
                        suffixIcon: IconButton(
                          onPressed: () {
                            DatePicker.showTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (time) {
                                final formattedTime =
                                    DateFormat('HH:mm').format(time);
                                setState(() {
                                  endTimeController.text = formattedTime;
                                });
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                          icon: Icon(
                            LucideIcons.clock,
                            color: AppColors.greyColor.withOpacity(0.6),
                            size: 20,
                          ),
                        ),
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
