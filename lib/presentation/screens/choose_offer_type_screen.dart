// lib/presentation/pages/choose_offer_type_screen.dart

import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/presentation/screens/fill_offer_screen.dart';
import 'package:hirafi/presentation/widgets/app_card.dart';

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
              'Choose how you want to create your offer:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 20),
            _buildOfferTypeCard(
              context,
              icon: Icons.handshake,
              title: 'Direct Offer (عرض مباشر)',
              description:
                  'Send personnalized offer directly to artisans that match your offer.',
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
              icon: Icons.gavel,
              context,
              title: 'Offer By Tender (بالمناقصة)',
              description:
                  'Set your budget and receive propsals from multiple artisans.',
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
            const SizedBox(height: 20),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withValues(alpha: .05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Icon(
                      Icons.info_outline,
                      color: AppColors.blackColor.withValues(alpha: .8),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width - 100,
                    child: Text(
                      'Choose "Direct Offer" if you want to send a personalized offer to a specific artisan that matches your offer details, or "Offer by Tender" to receive proposals from multiple artisan.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.blackColor.withValues(alpha: .8),
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOfferTypeCard(
    BuildContext context, {
    required String title,
    required IconData icon,
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
                Row(
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withValues(alpha: .05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.blackColor.withValues(alpha: .8),
                        size: 20,
                      ),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor.withValues(alpha: .8),
                          ),
                    ),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor,
                      size: 16,
                    ),
                  ],
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
        ],
      ),
    );
  }
}
