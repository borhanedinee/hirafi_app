import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/locale_controller.dart';
import 'package:hirafi/presentation/screens/help__center_screen.dart';
import 'package:hirafi/presentation/screens/notifications_screen.dart';
import 'package:hirafi/presentation/screens/payment_methods_screen.dart';
import 'package:hirafi/presentation/screens/personal_information_screen.dart';
import 'package:hirafi/services/show_language_dialog.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Container(
      decoration: AppThemes.scaffoldBackgroundDecoration,
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          // APP BAR
          Container(
            height: 60,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  localizations.clientProfileScreen_myProfile,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                ),
                Icon(
                  Icons.settings,
                  size: 20,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.greyColor.withOpacity(0.5),
            height: 1,
          ),
          // PROFILE INFOS
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileInfo(context),

                  SizedBox(height: 16),

                  // PROFILE LEVEL
                  _buildProfileLevel(context),

                  SizedBox(height: 16),

                  // PROFILE SETTINGS
                  _buildProfileSettingsAndLogoutButton(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildProfileSettingsAndLogoutButton(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
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
            localizations.clientProfileScreen_accountSettings,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          SizedBox(
            height: 16,
          ),
          // SETTINGS LIST
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final List<Map<String, dynamic>> profileOptions = [
                {
                  'title':
                      localizations.clientProfileScreen_personalInformation,
                  'prefixIcon': Icons.person,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalInformationScreen(),
                      ),
                    );
                  },
                },
                {
                  'title': localizations.clientProfileScreen_notifications,
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
                  'title': localizations.clientProfileScreen_paymentMethods,
                  'prefixIcon': Icons.payment,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethodsScreen()),
                    );
                  },
                },
                {
                  'title': localizations.clientProfileScreen_helpCenter,
                  'prefixIcon': Icons.help_center,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HelpCenterScreen(),
                      ),
                    );
                  },
                },
                {
                  'title': localizations.clientProfileScreen_language,
                  'prefixIcon': Icons.language,
                  'trailing': Icons.arrow_forward_ios,
                  'onTap': () {
                    showChangeLanguageDialog(
                      context,
                      (selectedLanguage) {
                        Get.find<LocaleController>()
                            .setLocale(selectedLanguage);
                        print('done');
                      },
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
                  onTap: option['onTap'],
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
                print('Logout button pressed');
              },
              icon: Icon(
                LucideIcons.logOut,
                color: AppColors.whiteColor,
              ),
              label: Text(
                localizations.clientProfileScreen_logout,
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
    final localizations = AppLocalizations.of(context)!;
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
                localizations.clientProfileScreen_clientLevel,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              Text(
                localizations.clientProfileScreen_silver,
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
                localizations.clientProfileScreen_ordersCount('12'),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                localizations.clientProfileScreen_ordersForGold('20'),
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
                    localizations
                        .clientProfileScreen_completeOrdersForGold('8'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
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
            'Boussaha Borhanedine', // Note: User name is typically dynamic, not localized
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          // USER MEMBER SINCE
          Text(
            localizations.clientProfileScreen_memberSince('February 2024'),
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
                  localizations.clientProfileScreen_silverMember,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // USER ORDERS RATING ETC
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '12', // Dynamic data, not localized
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    localizations.clientProfileScreen_orders,
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
                    '0', // Dynamic data, not localized
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    localizations.clientProfileScreen_favoriteArtisans,
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
                    '4.8', // Dynamic data, not localized
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    localizations.clientProfileScreen_rating,
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
