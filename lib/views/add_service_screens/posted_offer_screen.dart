// lib/presentation/pages/post_offer_screen.dart

import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

class PostOfferScreen extends StatelessWidget {
  const PostOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Posted'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
              'Offer Posted Successfully!',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your offer has been posted to the app. Artisans will contact you soon.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                    context, (route) => route.isFirst); // Return to HomeScreen
              },
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
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
