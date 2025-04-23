import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      required this.hintText,
      this.fillColor,
      this.initialValue});

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final String hintText;
  final String? initialValue;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.blackColor,
          ),
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: fillColor ?? AppColors.greyColor.withValues(alpha: .05),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor
                .withOpacity(0.2), // Light grey for unfocused border
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.greyColor.withOpacity(0.5),
            ),
      ),
    );
  }
}
