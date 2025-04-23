import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationsPressed;

  const HomeAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onNotificationsPressed,
    required this.isArtisan,
  });
  final bool isArtisan;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: onMenuPressed,
      ),
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logos/logo1.png',
            height: 35,
            width: 50,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          isArtisan
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Borhanedine B',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      'Annaba, Algeria',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
          Spacer(),
          isArtisan ? _buildUpgradeButton(context) : SizedBox(),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: AppColors.primaryColor,
            size: 20,
          ),
          onPressed: onNotificationsPressed,
        ),
      ],
    );
  }

  Container _buildUpgradeButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
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
            LucideIcons.crown,
            color: AppColors.primaryColor,
            size: 16,
          ),
          Text(
            'Upgrade',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
