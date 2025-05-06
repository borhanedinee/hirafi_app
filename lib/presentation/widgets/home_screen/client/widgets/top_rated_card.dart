import 'package:flutter/material.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/presentation/screens/client_screens/artisan_profile_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopRatedArtisanCard extends StatelessWidget {
  final ArtisanModel artisan;

  const TopRatedArtisanCard({super.key, required this.artisan});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => ArtisanProfileDetailsScreen(
              artisan: artisan,
              hasToNavigateToFillDirectOrder: true,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: size.width * 0.7 * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  artisan.avatar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artisan.fullName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      artisan.category,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                    const SizedBox(width: 10),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 15),
                        SizedBox(width: 3),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .topRatedArtisansCard_proffesional,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .topRatedArtisansCard_availableNow,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
