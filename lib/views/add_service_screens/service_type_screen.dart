// lib/presentation/pages/choose_offer_type_screen.dart

import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/views/fill_offer_screen.dart';
import 'package:hirafi/widgets/app_card.dart';

class ChooseOfferTypeScreen extends StatelessWidget {
  const ChooseOfferTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Order',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Choose Offer Type',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 20),
            _buildOfferTypeCard(
              context,
              title: 'Direct Offer (عرض مباشر)',
              description: 'Choose an artisan directly and send your offer.',
              onTypeTapped: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FillOfferDetailsScreen(
                      isDirectOffer: true,
                      isSendDirectly: false,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildOfferTypeCard(
              context,
              title: 'By Tender (بالمناقصة)',
              description: 'Post your offer and let artisans contact \nyou.',
              onTypeTapped: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FillOfferDetailsScreen(
                      isDirectOffer: false,
                      isSendDirectly: false,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferTypeCard(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onTypeTapped,
  }) {
    return AppCard(
      onCardTapped: onTypeTapped,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.greyColor,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
