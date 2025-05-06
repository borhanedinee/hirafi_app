import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirafi/presentation/controller/locale_controller.dart';
import 'package:hirafi/core/themes/app_colors.dart';

Future<void> showChangeLanguageDialog(
    BuildContext context, Function(String) onLanguageSelected) async {
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return GetBuilder<LocaleController>(
            builder: (controller) => Dialog(
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
                      'Change Language',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                    ),
                    const SizedBox(height: 20),
                    // Language Options
                    _buildLanguageOption(
                      context: context,
                      language: 'English',
                      flag: '🇬🇧',
                      isSelected: controller.stringLanguage == 'English',
                      onTap: () {
                        setState(() {
                          controller.stringLanguage = 'English';
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildLanguageOption(
                      context: context,
                      language: 'French',
                      flag: '🇫🇷',
                      isSelected: controller.stringLanguage == 'French',
                      onTap: () {
                        setState(() {
                          controller.stringLanguage = 'French';
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildLanguageOption(
                      context: context,
                      language: 'Arabic',
                      flag: '🇩🇿',
                      isSelected: controller.stringLanguage == 'Arabic',
                      onTap: () {
                        setState(() {
                          controller.stringLanguage = 'Arabic';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          onLanguageSelected(controller.stringLanguage!);
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Confirm',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

// Helper widget to build each language option
Widget _buildLanguageOption({
  required BuildContext context,
  required String language,
  required String flag,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? AppColors.primaryColor
              : Colors.grey.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              language,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? AppColors.primaryColor : Colors.black,
                  ),
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: AppColors.primaryColor,
              size: 20,
            ),
        ],
      ),
    ),
  );
}
