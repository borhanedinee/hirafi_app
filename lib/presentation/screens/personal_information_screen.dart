import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hirafi/core/app_colors.dart';
import 'package:hirafi/core/constants/wilayas_to_daira.dart';
import 'package:hirafi/core/dummy_data.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalDataController _globalDataController =
      Get.find<GlobalDataController>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Work Information Fields
  String? _selectedArtisanCategory;
  List<String> _selectedServices = [];
  String? _selectedWilaya;
  String? _selectedCommune;
  List<String> _selectedDays = [];
  Map<String, TimeOfDay> _startTimes = {};
  Map<String, TimeOfDay> _endTimes = {};

  @override
  void initState() {
    super.initState();
    // Initialize with sample data (replace with actual user data)
    final isArtisan = _globalDataController.isArtisan ?? false;
    _firstNameController.text = isArtisan ? 'Abdelalim' : 'Farouk';
    _secondNameController.text = isArtisan ? 'Saada' : 'Mansouri';
    _emailController.text = isArtisan ? 'saada@gmail.com' : 'faroukk@gmail.com';
    _phoneController.text = '+213 664656525';
    if (isArtisan) {
      _selectedArtisanCategory = 'الكهرباء';
      _selectedServices = ['إصلاح الأعطال المفاجئة وانقطاع التيار'];
      _selectedWilaya = 'باتنة';
      _selectedCommune = 'تيمقاد';
      _selectedDays = ['Monday', 'Tuesday'];
      _startTimes = {
        'Monday': const TimeOfDay(hour: 8, minute: 0),
        'Tuesday': const TimeOfDay(hour: 8, minute: 0),
      };
      _endTimes = {
        'Monday': const TimeOfDay(hour: 17, minute: 0),
        'Tuesday': const TimeOfDay(hour: 17, minute: 0),
      };
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    final l10n = AppLocalizations.of(context)!;
    bool isValid = true;
    if (_globalDataController.isArtisan ?? false) {
      if (_selectedArtisanCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.personalInfoScreen_selectCategory)),
        );
        isValid = false;
      }
      if (_selectedServices.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.personalInfoScreen_selectServices)),
        );
        isValid = false;
      }
      if (_selectedWilaya == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.personalInfoScreen_selectWilaya)),
        );
        isValid = false;
      }
      if (_selectedCommune == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.personalInfoScreen_selectCommune)),
        );
        isValid = false;
      }
      if (_selectedDays.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.personalInfoScreen_selectDays)),
        );
        isValid = false;
      }
      for (String day in _selectedDays) {
        if (_startTimes[day] == null || _endTimes[day] == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.personalInfoScreen_invalidHours)),
          );
          isValid = false;
          break;
        }
      }
    }
    return isValid;
  }

  void _saveChanges() {
    if (_validateForm()) {
      // Save data to GlobalDataController (placeholder)
      // _globalDataController.updateUserData({
      //   'firstName': _firstNameController.text,
      //   'secondName': _secondNameController.text,
      //   'email': _emailController.text,
      //   'phone': _phoneController.text,
      //   if (_globalDataController.isArtisan ?? false) ...{
      //     'category': _selectedArtisanCategory,
      //     'services': _selectedServices,
      //     'wilaya': _selectedWilaya,
      //     'commune': _selectedCommune,
      //     'workingDays': _selectedDays,
      //     'workingHours': {
      //       for (String day in _selectedDays)
      //         day: {
      //           'start': _startTimes[day],
      //           'end': _endTimes[day],
      //         },
      //     },
      //   },
      // });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Changes saved successfully')),
      );
    }
  }

  Widget _buildCategoryDropdownField() {
    final l10n = AppLocalizations.of(context)!;
    final List<String> _artisanCategoryServices = artisanServices.keys.toList();

    return DropdownButtonFormField<String>(
      value: _selectedArtisanCategory,
      hint: Text(
        l10n.personalInfoScreen_category,
        style: TextStyle(color: AppColors.greyColor, fontSize: 14),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: 0.05),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          child: Text(category, style: Theme.of(context).textTheme.titleSmall),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedServices.clear();
          _selectedArtisanCategory = value;
        });
      },
    );
  }

  Widget _buildServicesDropdownField({required String? selectedCategory}) {
    final l10n = AppLocalizations.of(context)!;
    if (selectedCategory == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greyColor.withValues(alpha: 0.2)),
        ),
        child: PopupMenuButton<String>(
          offset: const Offset(0, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onSelected: (value) {},
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                enabled: false,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setMenuState) {
                    return Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              artisanServices[selectedCategory]!.map((service) {
                            return CheckboxListTile(
                              value: _selectedServices.contains(service),
                              title: Text(service,
                                  style: const TextStyle(fontSize: 14)),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedServices.add(service);
                                  } else {
                                    _selectedServices.remove(service);
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
                _selectedServices.isEmpty
                    ? l10n.personalInfoScreen_services
                    : '${_selectedServices.length} service${_selectedServices.length == 1 ? '' : 's'} selected',
                style: TextStyle(
                  color: _selectedServices.isEmpty
                      ? AppColors.greyColor
                      : AppColors.blackColor,
                  fontSize: 14,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: AppColors.greyColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWilayaDropdownField() {
    final List _wilayas = WILAYA_TO_DAIRA.map(
      (e) {
        return e['wilaya_name'];
      },
    ).toList();
    final l10n = AppLocalizations.of(context)!;
    return DropdownButtonFormField<String>(
      value: _selectedWilaya,
      hint: Text(
        l10n.personalInfoScreen_wilaya,
        style: TextStyle(color: AppColors.greyColor, fontSize: 14),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: 0.05),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      items: _wilayas.map((wilaya) {
        return DropdownMenuItem<String>(
          value: wilaya,
          child: Text(wilaya),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedWilaya = value;
          _selectedCommune = null; // Reset commune when wilaya changes
        });
      },
    );
  }

  Widget _buildCommuneDropdownField({required String? selectedWilaya}) {
    final l10n = AppLocalizations.of(context)!;
    if (selectedWilaya == null) {
      return const SizedBox.shrink();
    }
    final List<String> _communes = WILAYA_TO_DAIRA.firstWhere(
      (e) => e['wilaya_name'] == selectedWilaya,
      orElse: () => {'daira_names': []},
    )['daira_names'] as List<String>;

    return DropdownButtonFormField<String>(
      value: _selectedCommune,
      hint: Text(
        l10n.personalInfoScreen_commune,
        style: TextStyle(color: AppColors.greyColor, fontSize: 14),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: 0.05),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      items: _communes.map((commune) {
        return DropdownMenuItem<String>(
          value: commune,
          child: Text(commune),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCommune = value;
        });
      },
    );
  }

  Widget _buildWorkingDaysField() {
    final l10n = AppLocalizations.of(context)!;
    final List<String> _days = [
      l10n.artisanSignUp2Screen_sunday,
      l10n.artisanSignUp2Screen_monday,
      l10n.artisanSignUp2Screen_tuesday,
      l10n.artisanSignUp2Screen_wednesday,
      l10n.artisanSignUp2Screen_thursday,
      l10n.artisanSignUp2Screen_friday,
      l10n.artisanSignUp2Screen_saturday,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyFieldHeader(headingText: l10n.personalInfoScreen_workingDays),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: _days.map((day) {
              return CheckboxListTile(
                value: _selectedDays.contains(day),
                title: Text(
                  day, // Replace with dynamic day mapping
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedDays.add(day);
                    } else {
                      _selectedDays.remove(day);
                      _startTimes.remove(day);
                      _endTimes.remove(day);
                    }
                  });
                },
                activeColor: AppColors.primaryColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildWorkingHoursField() {
    final l10n = AppLocalizations.of(context)!;
    if (_selectedDays.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyFieldHeader(headingText: l10n.personalInfoScreen_workingHours),
        const SizedBox(height: 8),
        ..._selectedDays.map((day) {
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day, // Replace with dynamic day mapping
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: _startTimes[day] ??
                                  const TimeOfDay(hour: 8, minute: 0),
                            );
                            if (time != null) {
                              setState(() {
                                _startTimes[day] = time;
                              });
                            }
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              _startTimes[day]?.format(context) ?? 'Select',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: _endTimes[day] ??
                                  const TimeOfDay(hour: 17, minute: 0),
                            );
                            if (time != null) {
                              setState(() {
                                _endTimes[day] = time;
                              });
                            }
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'End Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              _endTimes[day]?.format(context) ?? 'Select',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArtisan = _globalDataController.isArtisan ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.personalInfoScreen_title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  l10n.personalInfoScreen_manageInfo,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.greyColor,
                      ),
                ),
                const SizedBox(height: 32),
                // Profile Avatar
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            isArtisan
                                ? 'assets/images/avatars/electrician_avatar.jpg'
                                : 'assets/images/avatars/client_avatar.jpg',
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton.filled(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: AppColors.whiteColor,
                            size: 18,
                          ),
                          onPressed: () {
                            // Implement image picker
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Personal Information Fields
                MyFieldHeader(headingText: l10n.personalInfoScreen_firstName),
                const SizedBox(height: 8),
                MyTextField(
                  controller: _firstNameController,
                  hintText: '',
                  prefixIcon:
                      const Icon(Icons.person, color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                MyFieldHeader(headingText: l10n.personalInfoScreen_secondName),
                const SizedBox(height: 8),
                MyTextField(
                  controller: _secondNameController,
                  hintText: '',
                  prefixIcon:
                      const Icon(Icons.person, color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                MyFieldHeader(
                    headingText: l10n.personalInfoScreen_emailAddress),
                const SizedBox(height: 8),
                MyTextField(
                  controller: _emailController,
                  hintText: '',
                  prefixIcon:
                      const Icon(Icons.email, color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                MyFieldHeader(headingText: l10n.personalInfoScreen_phoneNumber),
                const SizedBox(height: 8),
                MyTextField(
                  controller: _phoneController,
                  hintText: '',
                  prefixIcon:
                      const Icon(Icons.phone, color: AppColors.greyColor),
                ),
                const SizedBox(height: 32),
                // Artisan Work Information (Conditional)
                if (isArtisan) ...[
                  Text(
                    l10n.personalInfoScreen_workInfo,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  MyFieldHeader(headingText: l10n.personalInfoScreen_category),
                  const SizedBox(height: 8),
                  _buildCategoryDropdownField(),
                  const SizedBox(height: 16),
                  MyFieldHeader(headingText: l10n.personalInfoScreen_services),
                  const SizedBox(height: 8),
                  _buildServicesDropdownField(
                      selectedCategory: _selectedArtisanCategory),
                  const SizedBox(height: 16),
                  MyFieldHeader(headingText: l10n.personalInfoScreen_wilaya),
                  const SizedBox(height: 8),
                  _buildWilayaDropdownField(),
                  const SizedBox(height: 16),
                  MyFieldHeader(headingText: l10n.personalInfoScreen_commune),
                  const SizedBox(height: 8),
                  _buildCommuneDropdownField(selectedWilaya: _selectedWilaya),
                  const SizedBox(height: 16),
                  _buildWorkingDaysField(),
                  const SizedBox(height: 16),
                  _buildWorkingHoursField(),
                  const SizedBox(height: 32),
                ],
                // Save Button
                Center(
                  child: Container(
                    width: size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        l10n.personalInfoScreen_saveChanges,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.greyColor, thickness: 1),
                const SizedBox(height: 16),
                // Change Password Button
                Center(
                  child: Container(
                    width: size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: AppColors.blackColor),
                        ),
                        backgroundColor: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.lock,
                        color: AppColors.blackColor,
                        size: 14,
                      ),
                      label: Text(
                        l10n.personalInfoScreen_changePassword,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.blackColor,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Delete Account Button
                Center(
                  child: Container(
                    width: size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.red),
                        ),
                        backgroundColor: AppColors.whiteColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                      ),
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: Text(
                        l10n.personalInfoScreen_deleteAccount,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
