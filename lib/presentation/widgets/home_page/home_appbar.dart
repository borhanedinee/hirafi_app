import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

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
        children: [
          Image.asset(
            'assets/images/logos/logo1.png',
            height: 35,
            width: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          isArtisan
              ? Text(
                  'Herrafi',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Borhanedine B',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      'Annaba, Algeria',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: AppColors.primaryColor,
          ),
          onPressed: onNotificationsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
