import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/help__center_screen.dart';
import 'package:hirafi/presentation/screens/notifications_screen.dart';
import 'package:hirafi/presentation/screens/payment_methods_screen.dart';
import 'package:hirafi/presentation/screens/personal_information_screen.dart';
import 'package:hirafi/services/show_image_view_dialog.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisanProfileScreen extends StatelessWidget {
  const ArtisanProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  loc.artisanProfileScreen_myProfile,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.crown,
                        color: AppColors.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        loc.artisanProfileScreen_upgrade,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.greyColor.withOpacity(0.5),
            height: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileInfo(context, loc),
                  const SizedBox(height: 16),
                  _buildWorkGallery(context, loc),
                  const SizedBox(height: 16),
                  _buildProfileSettingsAndLogoutButton(context, loc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildWorkGallery(BuildContext context, AppLocalizations loc) {
    const artisanCategory = 'Painter'; // Hardcoded as sample data
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.artisanProfileScreen_workGallery,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                Text(
                  loc.artisanProfileScreen_add,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.primaryColor,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Container _buildProfileSettingsAndLogoutButton(
      BuildContext context, AppLocalizations loc) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.artisanProfileScreen_accountSettings,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> profileOptions = [
                {
                  'title': loc.artisanProfileScreen_personalInformation,
                  'prefixIcon': Icons.person,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInformationScreen(),
                      ),
                    );
                  },
                },
                {
                  'title': loc.artisanProfileScreen_notifications,
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
                  'title': loc.artisanProfileScreen_helpCenter,
                  'prefixIcon': Icons.help_center,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HelpCenterScreen(),
                      ),
                    );
                  },
                },
              ];

              final option = profileOptions[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    option['prefixIcon'],
                    color: AppColors.greyColor,
                  ),
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
            padding: const EdgeInsets.symmetric(),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle logout action here
                print('Logout button pressed');
              },
              icon: const Icon(
                LucideIcons.logOut,
                color: AppColors.whiteColor,
              ),
              label: Text(
                loc.artisanProfileScreen_logout,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context, AppLocalizations loc) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
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
                'assets/images/avatars/client_avatar.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            loc.artisanProfileScreen_userName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              loc.artisanProfileScreen_category,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            loc.artisanProfileScreen_memberSince('February 2024'),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.trophy,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  loc.artisanProfileScreen_membership,
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
                    loc.artisanProfileScreen_completedOrders,
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
                    loc.artisanProfileScreen_ratingReviews('12'),
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
}
