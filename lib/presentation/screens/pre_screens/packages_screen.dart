import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/packages_screen/package_card.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key, required this.isArtisan}) : super(key: key);

  final bool isArtisan;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width - 100,
                  child: Text(
                    l10n.packagesScreen_choosePackage,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                PackageCard(
                  planName: l10n.packagesScreen_freePackage_name,
                  price: l10n.packagesScreen_freePackage_price,
                  features: [
                    l10n.packagesScreen_freePackage_feature1,
                    l10n.packagesScreen_freePackage_feature2,
                    l10n.packagesScreen_freePackage_feature3,
                  ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 16),
                PackageCard(
                  isArtisan: isArtisan,
                  planName: l10n.packagesScreen_silverPackage_name,
                  price: l10n.packagesScreen_silverPackage_price,
                  features: [
                    l10n.packagesScreen_silverPackage_feature1,
                    l10n.packagesScreen_silverPackage_feature2,
                    l10n.packagesScreen_silverPackage_feature3,
                  ],
                ),
                const SizedBox(height: 16),
                PackageCard(
                  planName: l10n.packagesScreen_goldPackage_name,
                  price: l10n.packagesScreen_goldPackage_price,
                  features: [
                    l10n.packagesScreen_goldPackage_feature1,
                    l10n.packagesScreen_goldPackage_feature2,
                    l10n.packagesScreen_goldPackage_feature3,
                  ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 16),
                PackageCard(
                  planName: l10n.packagesScreen_premiumPackage_name,
                  price: l10n.packagesScreen_premiumPackage_price,
                  features: isArtisan
                      ? [
                          l10n.packagesScreen_premiumPackage_artisan_feature1,
                          l10n.packagesScreen_premiumPackage_artisan_feature2,
                          l10n.packagesScreen_premiumPackage_artisan_feature3,
                        ]
                      : [
                          l10n.packagesScreen_premiumPackage_client_feature1,
                          l10n.packagesScreen_premiumPackage_client_feature2,
                          l10n.packagesScreen_premiumPackage_client_feature3,
                        ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
