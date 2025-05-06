import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/core/themes/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showAddGroupClientDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                AppLocalizations.of(context)!
                    .communityScreen_valueAddGroupClientDialogTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
              ),
              const SizedBox(height: 16),
              // Message
              Text(
                AppLocalizations.of(context)!
                    .communityScreen_valueAddGroupClientDialogMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 12),
              // Benefits
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  AppLocalizations.of(context)!
                      .communityScreen_valueAddGroupClientDialogBenefits,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              // OK Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!
                        .communityScreen_valueAddGroupClientDialogOkButton,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
