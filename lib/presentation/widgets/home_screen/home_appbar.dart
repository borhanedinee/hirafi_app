import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/presentation/screens/pre_screens/packages_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onNotificationsPressed;

  const HomeAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onNotificationsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    final isArtisan = Get.find<GlobalDataController>().isArtisan!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 400;
        final titleFontSize = isSmallScreen ? 12.0 : 13.0;
        final subtitleFontSize = isSmallScreen ? 9.0 : 10.0;
        final leadingWidth = isSmallScreen ? 60.0 : 80.0;
        final logoSize = isSmallScreen ? 32.0 : 40.0;
        final upgradeButtonPadding = isSmallScreen ? 4.0 : 8.0;

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: false,
          leadingWidth: leadingWidth,
          leading: Padding(
            padding:
                EdgeInsets.only(left: isRtl ? 0 : 24, right: isRtl ? 24 : 0),
            child: Image.asset(
              'assets/images/logos/logo1.png',
              height: logoSize,
              width: logoSize,
              fit: BoxFit.contain,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Flexible(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.4),
                  child: Column(
                    crossAxisAlignment: isRtl
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArtisan ? 'Saada Abdelalim' : 'Farouk Mn',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: titleFontSize,
                            ),
                        overflow: TextOverflow.ellipsis,
                        textDirection:
                            isRtl ? TextDirection.rtl : TextDirection.ltr,
                      ),
                      Text(
                        'Ain Temouchent, Algeria',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.greyColor,
                              fontSize: subtitleFontSize,
                            ),
                        overflow: TextOverflow.ellipsis,
                        textDirection:
                            isRtl ? TextDirection.rtl : TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              if (isArtisan)
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: isRtl ? 0 : 16, right: isRtl ? 16 : 0),
                    child: _buildUpgradeButton(
                      context,
                      loc,
                      isSmallScreen,
                      upgradeButtonPadding,
                      isRtl,
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: isSmallScreen ? 18 : 20,
              ),
              onPressed: onNotificationsPressed,
            ),
          ],
        );
      },
    );
  }

  Widget _buildUpgradeButton(
    BuildContext context,
    AppLocalizations loc,
    bool isSmallScreen,
    double padding,
    bool isRtl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PackagesScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: padding / 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Icon(
              LucideIcons.crown,
              color: AppColors.primaryColor,
              size: isSmallScreen ? 14 : 16,
            ),
            SizedBox(width: isSmallScreen ? 4 : 8),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: Text(
                  loc.homeAppBar_upgrade,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallScreen ? 10 : 12,
                      ),
                  overflow: TextOverflow.ellipsis,
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
