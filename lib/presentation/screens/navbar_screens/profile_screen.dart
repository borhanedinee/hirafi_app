import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppThemes.scaffoldBackgroundDecoration,
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // APP BAR
              Container(
                height: 80,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'My Profile',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.greyColor.withOpacity(0.5),
                height: 1,
              ),
              // PROFILE INFOS
              _buildProfileInfo(context),

              SizedBox(height: 16),

              // PROFILE LEVEL
              _buildProfileLevel(context),

              SizedBox(height: 16),

              // PROFILE SETTINGS
              _buildProfileSettingsAndLogoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProfileSettingsAndLogoutButton(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          // SETTINGS LIST
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> profileOptions = [
                {
                  'title': 'Personal Information',
                  'prefixIcon': Icons.person,
                  'trailing': Icons.arrow_forward_ios,
                },
                {
                  'title': 'Notifications',
                  'prefixIcon': Icons.notifications,
                  'trailing': Icons.arrow_forward_ios,
                },
                {
                  'title': 'Payment Methods',
                  'prefixIcon': Icons.payment,
                  'trailing': Icons.arrow_forward_ios,
                },
                {
                  'title': 'Help Center',
                  'prefixIcon': Icons.help_center,
                  'trailing': Icons.arrow_forward_ios,
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
                    color: AppColors.greyColor, // or any color you like
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
                  onTap: () {
                    // Handle tap event here
                    // For example, navigate to another screen or show a dialog
                    print('Tapped on ${option['title']}');
                  },
                ),
              );
            },
          ),
          SizedBox(height: 32),

          // LOGOUT BUTTON
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle logout action here
                print('Logout button pressed');
              },
              icon: Icon(
                LucideIcons.logOut,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'Logout',
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
          SizedBox(height: 60),
        ],
      ),
    );
  }

  Container _buildProfileLevel(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Client Level',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              Text(
                'Silver',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.greyColor,
                    ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // LEVEL PROGRESS BAR
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: AppColors.greyColor.withOpacity(0.2),
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
            minHeight: 8,
          ),
          SizedBox(height: 8),
          // LEVEL PROGRESS TEXT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12 Orders',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                '20 for Gold',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),

          // GUIDE
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  LucideIcons.info,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                SizedBox(width: 8),
                SizedBox(
                  width: size.width - 100,
                  child: Text(
                      'Complete 8 more orders to reach Gold level and unlock premium artisans.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.greyColor,
                          )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          // PROFILE PICTURE
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

          SizedBox(height: 16),

          // USER NAME
          Text(
            'John Doe',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          // USER MEMEBER SINCE
          Text(
            'Member since February 2024',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 16),
          // USER MEMBERSHIP
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
              spacing: 8,
              children: [
                Icon(
                  LucideIcons.trophy,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                Text(
                  'Silver Member',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // USER ORDERS RATIG ECT
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
                    'Orders',
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
                    '0',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Favorite Artisans',
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
                    'Rating',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
