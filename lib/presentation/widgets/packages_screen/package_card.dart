import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/core/themes/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackageCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> features;
  final VoidCallback? onSelect;

  const PackageCard({
    Key? key,
    required this.planName,
    required this.price,
    required this.features,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: size.width, // Fixed width to match the design
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Plan Name and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Features List
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: AppColors.primaryColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 16),
          // Select Plan Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSelect ??
                  () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => NavBarRootScreen(),
                      ),
                    );
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.primaryColor, // Dark teal color from the image
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                l10n.packagesScreen_choosePackage.split(' ').first,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
