import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key, required this.artisan}) : super(key: key);

  final ArtisanModel artisan;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  artisan.avatar,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      artisan.fullName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.blackColor,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          artisan.category,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.greyColor,
                                    fontSize: 14,
                                  ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: .4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            loc.profileSection_status_availableNow,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.green,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    _buildInfoRow(
                      context,
                      icon: Icons.star,
                      iconColor: Colors.yellow,
                      text: loc.profileSection_rating_reviews('4.7', '12'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    context,
                    icon: Icons.location_on,
                    iconColor: AppColors.primaryColor,
                    text: loc.profileSection_location,
                  ),
                  _buildInfoRow(
                    context,
                    icon: Icons.build,
                    iconColor: AppColors.primaryColor,
                    text: loc.profileSection_services_done('34'),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    context,
                    icon: Icons.access_time,
                    iconColor: AppColors.primaryColor,
                    text: loc.profileSection_experience('5'),
                  ),
                  _buildInfoRow(
                    context,
                    icon: Icons.people,
                    iconColor: AppColors.primaryColor,
                    text: loc.profileSection_clients_served('12'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: .9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.crown,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.profileSection_membership_title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      loc.profileSection_membership_subtitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.whiteColor.withValues(alpha: .8),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
