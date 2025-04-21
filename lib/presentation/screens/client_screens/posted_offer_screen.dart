// lib/presentation/pages/post_offer_screen.dart

import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class PostedSuccessfully extends StatelessWidget {
  const PostedSuccessfully(
      {super.key,
      required this.title,
      required this.description,
      required this.actionButtonText,
      required this.onActionPressed});

  final String title;
  final String description;
  final String actionButtonText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Offer Posted'),
        //   backgroundColor: AppColors.primaryColor,
        //   foregroundColor: Colors.white,
        // ),
        body: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.primaryColor,
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyColor,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: onActionPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  actionButtonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
