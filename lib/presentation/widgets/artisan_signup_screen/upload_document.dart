import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/core/themes/app_colors.dart';

class DottedUploadDocument extends StatefulWidget {
  const DottedUploadDocument(
      {super.key,
      required this.infoText,
      required this.descriptionText,
      required this.uploadButtonText,
      required this.documentTypeIcon});

  final String infoText;
  final String descriptionText;
  final String uploadButtonText;
  final Icon documentTypeIcon;
  @override
  State<DottedUploadDocument> createState() => _DottedUploadDocumentState();
}

class _DottedUploadDocumentState extends State<DottedUploadDocument> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        // Dashed Border Container
        SizedBox(
          width: size.width * .8,
          child: DottedBorder(
            color: Colors.grey,
            strokeWidth: 1,
            dashPattern: const [4, 4], // Dashed pattern: 4px dash, 4px gap
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: size.width * .8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Animated Icon
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: widget.documentTypeIcon,
                  ),
                  const SizedBox(height: 8),
                  // Main Text
                  Text(
                    widget.descriptionText,
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
                      Icons.upload,
                      size: 20,
                      color: AppColors.blackColor,
                    ),
                    label: Text(
                      widget.uploadButtonText,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blackColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Note Text
        Text(
          widget.infoText,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
