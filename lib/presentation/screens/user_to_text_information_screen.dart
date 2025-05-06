import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirafi/models/user_model.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';

class UserToTextInformationScreen extends StatelessWidget {
  final UserModel user;

  final bool iToTextArtisan;

  const UserToTextInformationScreen(
      {super.key, required this.user, required this.iToTextArtisan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Profile Header
          _buildSliverAppBar(context),
          // Main Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // About Section
                _buildAboutSection(context),
                const SizedBox(height: 20),
                // Contact Information
                _buildContactSection(context),
                const SizedBox(height: 20),
                // Action Buttons
                _buildActionButtons(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gradient Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryColor,
                    AppColors.primaryColor.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Profile Content
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.whiteColor, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        user.profileImage ??
                            'assets/images/avatars/default_avatar.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 60,
                            color: AppColors.whiteColor,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Role
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      !Get.find<GlobalDataController>().isArtisan!
                          ? AppLocalizations.of(context)!
                              .userInfoScreen_valueRoleArtisan
                          : AppLocalizations.of(context)!
                              .userInfoScreen_valueRoleClient,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            AppLocalizations.of(context)!.userInfoScreen_valueAboutTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 12),
          // About Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status
                Row(
                  children: [
                    Icon(
                      !Get.find<GlobalDataController>().isArtisan!
                          ? Icons.work
                          : Icons.search,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      !Get.find<GlobalDataController>().isArtisan!
                          ? AppLocalizations.of(context)!
                              .userInfoScreen_valueArtisanStatus
                          : AppLocalizations.of(context)!
                              .userInfoScreen_valueClientStatus,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Bio (Placeholder)
                Text(
                  !Get.find<GlobalDataController>().isArtisan!
                      ? AppLocalizations.of(context)!
                          .userInfoScreen_valueArtisanBio
                      : AppLocalizations.of(context)!
                          .userInfoScreen_valueClientBio,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            AppLocalizations.of(context)!.userInfoScreen_valueDetailsTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 12),
          // Contact Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Location
                _buildDetailRow(
                  context,
                  icon: LucideIcons.mapPin,
                  label: AppLocalizations.of(context)!
                      .userInfoScreen_valueLocationLabel,
                  value: user.location,
                ),
                const SizedBox(height: 16),
                // Phone
                _buildDetailRow(
                  context,
                  icon: LucideIcons.phone,
                  label: AppLocalizations.of(context)!
                      .userInfoScreen_valuePhoneLabel,
                  value: user.phone,
                ),
                const SizedBox(height: 16),
                // Email
                _buildDetailRow(
                  context,
                  icon: LucideIcons.mail,
                  label: AppLocalizations.of(context)!
                      .userInfoScreen_valueEmailLabel,
                  value: user.email,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primaryColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Call Button
          _buildActionButton(
            context: context,
            icon: Icons.phone,
            label: AppLocalizations.of(context)!.userInfoScreen_valueCallButton,
            onTap: () {
              // Handle call action (e.g., launch phone app with user.phone)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Calling ${user.phone}...')),
              );
            },
          ),
          // Message Button
          _buildActionButton(
            context: context,
            icon: Icons.message,
            label:
                AppLocalizations.of(context)!.userInfoScreen_valueMessageButton,
            onTap: () {
              // Navigate back to MessagesScreen (already in chat)
              Navigator.pop(context);
            },
          ),
          // Hire Button (Only for Artisans)
          if (!Get.find<GlobalDataController>().isArtisan!)
            _buildActionButton(
              context: context,
              icon: Icons.work,
              label:
                  AppLocalizations.of(context)!.userInfoScreen_valueHireButton,
              onTap: () {
                // Handle hire action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hiring ${user.name}...')),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: AppColors.whiteColor,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
