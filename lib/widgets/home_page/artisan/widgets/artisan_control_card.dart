import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';

class ArtisanControlCard extends StatefulWidget {
  const ArtisanControlCard({
    super.key,
  });

  @override
  State<ArtisanControlCard> createState() => _ArtisanControlCardState();
}

class _ArtisanControlCardState extends State<ArtisanControlCard> {
  bool isAvalibale = true;

  _toggleAvailability(newValue) {
    setState(() {
      isAvalibale = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              // AVATAR
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/avatars/electrician_avatar.jpg',
                  width: 50,
                  height: 50,
                ),
              ),

              // ARTISAN NAME AND RATING
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAME
                  Text(
                    'Saada Abdelalim',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  // STARS
                  Row(
                    spacing: 4,
                    children: [
                      // STARS ICONS
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24,
                      ),
                      Text(
                        '4.7 ( 23 reviews )',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),

          // AVAILABILITY TOGGLE
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // AVAILABILITY TEXT
                Text(
                  'Available for work',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // TOGGLE BUTTON
                Switch(
                  value: isAvalibale,
                  onChanged: (value) {
                    _toggleAvailability(value);
                  },
                  activeTrackColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // NEW REQUESTS AND PENDING REQUESTS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // NEW REQUESTS
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(alpha: .05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '11',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      'New Requests',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                  ],
                ),
              ),

              // PENDING REQUESTS
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(alpha: .05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      'Pending Requests',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
