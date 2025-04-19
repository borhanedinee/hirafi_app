import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/utils/app_colors.dart';

class UploadLicenseWidget extends StatefulWidget {
  const UploadLicenseWidget({super.key});

  @override
  State<UploadLicenseWidget> createState() => _UploadLicenseWidgetState();
}

class _UploadLicenseWidgetState extends State<UploadLicenseWidget>
    with TickerProviderStateMixin {
  bool _showExclamation = true;

  @override
  void initState() {
    super.initState();
    // Start the animation loop
    Future.delayed(const Duration(seconds: 1), _toggleIcon);
  }

  void _toggleIcon() {
    if (mounted) {
      setState(() {
        _showExclamation = !_showExclamation;
      });
      Future.delayed(const Duration(seconds: 1), _toggleIcon);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        // Dashed Border Container
        DottedBorder(
          color: Colors.grey,
          strokeWidth: 1,
          dashPattern: const [4, 4], // Dashed pattern: 4px dash, 4px gap
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Animated Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    _showExclamation ? '!' : '?',
                    key: ValueKey(_showExclamation),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Main Text
              const Text(
                'Upload your professional license or certificate',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Upload Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.upload,
                  size: 16,
                  color: AppColors.blackColor,
                ),
                label: Text(
                  'Upload Document',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blackColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor.withValues(alpha: .8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Note Text
        const Text(
          'You can add this later, but it will appear as a notification in your profile',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
