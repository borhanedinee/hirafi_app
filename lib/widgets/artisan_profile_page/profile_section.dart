import 'package:flutter/material.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key, required this.artisan}) : super(key: key);

  final ArtisanModel artisan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  artisan.avatar,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      artisan.fullName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.blackColor,
                          ),
                    ),
                    const SizedBox(height: 5),
                    // Category
                    Text(
                      artisan.category,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                    ),

                    const SizedBox(height: 5),
                    // Rating and Availability
                    _buildInfoRow(
                      context,
                      icon: Icons.star,
                      iconColor: Colors.yellow,
                      text: '4.7 (24 reviews )',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 5),
          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    context,
                    icon: Icons.location_on,
                    iconColor: AppColors.primaryColor,
                    text: 'Annaba, Annaba',
                  ),

                  // Services Completed
                  _buildInfoRow(
                    context,
                    icon: Icons.build,
                    iconColor: AppColors.primaryColor,
                    text: '34 services done',
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Years of Experience
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    context,
                    icon: Icons.access_time,
                    iconColor: AppColors.primaryColor,
                    text: '5 years of experience',
                  ),
                  const SizedBox(height: 5),
                  // Number of Different Clients
                  _buildInfoRow(
                    context,
                    icon: Icons.people,
                    iconColor: AppColors.primaryColor,
                    text: 'served 12 different clients',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              _generateStatus('Available Now'),
              _generateStatus('Verified'),
              _generateStatus('Professional'),
            ],
          ),
        ],
      ),
    );
  }

  // Add the helper function within the same class or as a standalone widget
  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.greyColor,
                fontSize: 12,
              ),
        ),
      ],
    );
  }

  Container _generateStatus(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
