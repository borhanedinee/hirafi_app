import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/controller/locale_controller.dart';
import 'package:hirafi/presentation/screens/help__center_screen.dart';
import 'package:hirafi/presentation/screens/notifications_screen.dart';
import 'package:hirafi/presentation/screens/personal_information_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:hirafi/presentation/screens/pre_screens/user_type_screen.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/services/show_image_view_dialog.dart';
import 'package:hirafi/services/show_language_dialog.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/core/dummy_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisanProfileScreen extends StatefulWidget {
  const ArtisanProfileScreen({Key? key}) : super(key: key);

  @override
  State<ArtisanProfileScreen> createState() => _ArtisanProfileScreenState();
}

class _ArtisanProfileScreenState extends State<ArtisanProfileScreen> {
  final GlobalDataController _globalDataController =
      Get.find<GlobalDataController>();
  List<Map<String, dynamic>> _certifications = [];

  @override
  void initState() {
    super.initState();
    // Initialize with sample certifications (replace with actual data)
    _certifications = [
      {
        'name': 'Electrical Safety Certification',
        'authority': 'Algerian Institute of Technology',
        'issueDate': DateTime(2023, 6, 15),
        'image': 'assets/images/avatars/diplome.png',
      },
      {
        'name': 'Master Electrician License',
        'authority': 'National Trades Board',
        'issueDate': DateTime(2022, 9, 10),
        'image': 'assets/images/avatars/diplome.png',
      },
    ];
  }

  void _showCertificationForm(
      {Map<String, dynamic>? certification, int? index}) {
    final l10n = AppLocalizations.of(context)!;
    final TextEditingController nameController =
        TextEditingController(text: certification?['name']);
    final TextEditingController authorityController =
        TextEditingController(text: certification?['authority']);
    DateTime? selectedDate = certification?['issueDate'];
    XFile? selectedImage =
        certification?['image'] != null ? XFile(certification!['image']) : null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            certification == null
                ? l10n.artisanProfileScreen_addCertification
                : l10n.artisanProfileScreen_editCertification,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.blackColor),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextField(
                  controller: nameController,
                  hintText: l10n.artisanProfileScreen_certificationName,
                  prefixIcon: const Icon(Icons.card_membership,
                      color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                MyTextField(
                  controller: authorityController,
                  hintText: l10n.artisanProfileScreen_issuingAuthority,
                  prefixIcon:
                      const Icon(Icons.business, color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: l10n.artisanProfileScreen_issueDate,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      selectedDate != null
                          ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                          : 'Select Date',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final picker = ImagePicker();
                          final image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              selectedImage = image;
                            });
                          }
                        },
                        icon: const Icon(Icons.image,
                            color: AppColors.whiteColor),
                        label: Text(
                          l10n.artisanProfileScreen_selectImage,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    if (selectedImage != null) ...[
                      const SizedBox(width: 8),
                      IconButton(
                        icon:
                            const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            selectedImage = null;
                          });
                        },
                      ),
                    ],
                  ],
                ),
                if (selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      selectedImage!.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.artisanProfileScreen_cancel,
                  style: TextStyle(color: AppColors.greyColor)),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(l10n.artisanProfileScreen_invalidName)),
                  );
                  return;
                }
                if (authorityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text(l10n.artisanProfileScreen_invalidAuthority)),
                  );
                  return;
                }
                if (selectedDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(l10n.artisanProfileScreen_invalidDate)),
                  );
                  return;
                }
                setState(() {
                  final newCertification = {
                    'name': nameController.text,
                    'authority': authorityController.text,
                    'issueDate': selectedDate,
                    'image': selectedImage?.path,
                  };
                  if (index != null) {
                    _certifications[index] = newCertification;
                  } else {
                    _certifications.add(newCertification);
                  }
                });
                // // Save to GlobalDataController (placeholder)
                // _globalDataController
                //     .updateUserData({'certifications': _certifications});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text(l10n.artisanProfileScreen_certificationSaved)),
                );
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(l10n.artisanProfileScreen_save,
                  style: const TextStyle(color: AppColors.whiteColor)),
            ),
          ],
        );
      },
    );
  }

  void _deleteCertification(int index) {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _certifications.removeAt(index);
    });
    // _globalDataController.updateUserData({'certifications': _certifications});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.artisanProfileScreen_certificationDeleted)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: AppThemes.scaffoldBackgroundDecoration,
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
            height: 60,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(color: AppColors.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.artisanProfileScreen_myProfile,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const PackagesScreen()),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LucideIcons.crown,
                            color: AppColors.primaryColor, size: 14),
                        const SizedBox(width: 8),
                        Text(
                          l10n.artisanProfileScreen_upgrade,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.greyColor.withOpacity(0.5), height: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileInfo(context, l10n),
                  const SizedBox(height: 16),
                  _buildWorkGallery(context, l10n),
                  const SizedBox(height: 16),
                  _buildCertificationsSection(context, l10n),
                  const SizedBox(height: 16),
                  _buildProfileSettingsAndLogoutButton(context, l10n),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/avatars/electrician_avatar.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.artisanProfileScreen_userName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              l10n.artisanProfileScreen_category,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.artisanProfileScreen_memberSince('February 2024'),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.trophy,
                    color: AppColors.primaryColor, size: 16),
                const SizedBox(width: 8),
                Text(
                  l10n.artisanProfileScreen_membership,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    l10n.artisanProfileScreen_completedOrders,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 1,
                color: AppColors.greyColor.withOpacity(0.5),
              ),
              Column(
                children: [
                  Text(
                    '4.8',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    l10n.artisanProfileScreen_ratingReviews('12'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildWorkGallery(BuildContext context, AppLocalizations l10n) {
    const artisanCategory = 'Painter'; // Hardcoded as sample data
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.artisanProfileScreen_workGallery,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Implement add work image functionality
                  },
                  child: Text(
                    l10n.artisanProfileScreen_add,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: List.generate(
                    imagesByCategories[artisanCategory]!.length, (index) {
                  final image = imagesByCategories[artisanCategory]![index];
                  return GestureDetector(
                    onTap: () => showImageViewerDialog(context, image),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCertificationsSection(
      BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.artisanProfileScreen_certifications,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.blackColor),
                ),
                GestureDetector(
                  onTap: () => _showCertificationForm(),
                  child: Text(
                    l10n.artisanProfileScreen_add,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          if (_certifications.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No certifications added yet.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.greyColor),
              ),
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: List.generate(_certifications.length, (index) {
                    final cert = _certifications[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 220,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cert['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackColor,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                cert['authority'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.greyColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${cert['issueDate'].day}/${cert['issueDate'].month}/${cert['issueDate'].year}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.greyColor),
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: cert['image'] != null
                                    ? () => showImageViewerDialog(
                                        context, cert['image'])
                                    : null,
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: cert['image'] != null
                                      ? Image.asset(
                                          cert['image'],
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Icon(
                                            Icons.broken_image,
                                            color: AppColors.greyColor,
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            l10n.artisanProfileScreen_noImage,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: AppColors.greyColor,
                                                ),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: AppColors.primaryColor,
                                        size: 20),
                                    onPressed: () => _showCertificationForm(
                                        certification: cert, index: index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red, size: 20),
                                    onPressed: () =>
                                        _deleteCertification(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Container _buildProfileSettingsAndLogoutButton(
      BuildContext context, AppLocalizations l10n) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.artisanProfileScreen_accountSettings,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.blackColor),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> profileOptions = [
                {
                  'title': l10n.artisanProfileScreen_personalInformation,
                  'prefixIcon': Icons.person,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PersonalInformationScreen()),
                    );
                  },
                },
                {
                  'title': l10n.artisanProfileScreen_notifications,
                  'prefixIcon': Icons.notifications,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsScreen()),
                    );
                  },
                },
                {
                  'title': l10n.artisanProfileScreen_helpCenter,
                  'prefixIcon': Icons.help_center,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const HelpCenterScreen()),
                    );
                  },
                },
                {
                  'title': l10n.clientProfileScreen_language,
                  'prefixIcon': Icons.language,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    showChangeLanguageDialog(context, (selectedLanguage) {
                      Get.find<LocaleController>().setLocale(selectedLanguage);
                    });
                  },
                },
              ];

              final option = profileOptions[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: AppColors.greyColor.withOpacity(0.5)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      Icon(option['prefixIcon'], color: AppColors.greyColor),
                  title: Text(
                    option['title'],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  trailing: Icon(
                    option['trailing'],
                    color: AppColors.greyColor.withOpacity(0.5),
                    size: 16,
                  ),
                  onTap: () => option['onTap'](),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          Container(
            width: size.width,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const UserTypeScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(LucideIcons.logOut, color: AppColors.whiteColor),
              label: Text(
                l10n.artisanProfileScreen_logout,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
