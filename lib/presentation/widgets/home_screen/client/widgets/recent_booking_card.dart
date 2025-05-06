import 'package:flutter/material.dart';
import 'package:hirafi/main.dart'; // Assuming this contains size and other utilities
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/presentation/screens/client_screens/recent_order_details_screen.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/enums/booking_status_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Added for localization

class RecentBookingCard extends StatelessWidget {
  final ArtisanModel artisan;
  final String date;
  final BookingStatus status;
  final VoidCallback onRebook;

  const RecentBookingCard({
    super.key,
    required this.artisan,
    required this.date,
    required this.status,
    required this.onRebook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecentOrderDetailsScreen(
                artisan: artisan,
                date: date,
                status: status,
                orderDescription: AppLocalizations.of(context)!
                    .recentBookingCard_orderDescription,
                orderPrice:
                    AppLocalizations.of(context)!.recentBookingCard_orderPrice),
          ),
        );
      },
      child: Container(
        width: size.width * 0.75, // Assuming size is defined in main.dart
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          artisan.avatar,
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        artisan.fullName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                StatusChip(status: status), // Use the StatusChip widget
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        artisan.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.greyColor, fontSize: 12),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onRebook,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      AppLocalizations.of(context)!
                          .recentBookingCard_viewDetails,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final BookingStatus status;

  const StatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.backgroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            status.icon,
            size: 14,
            color: status.textColor,
          ),
          const SizedBox(width: 4),
          Text(
            status.displayName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: status.textColor,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
