import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/services/show_image_view_dialog.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/core/dummy_data.dart';
import 'package:hirafi/presentation/screens/client_screens/fill_offer_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_profile_screen/profile_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisanProfileDetailsScreen extends StatelessWidget {
  const ArtisanProfileDetailsScreen({
    super.key,
    required this.artisan,
    this.hasToNavigateToFillDirectOrder = false,
  });
  final bool hasToNavigateToFillDirectOrder;
  final ArtisanModel artisan;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(loc),
        body: Stack(
          children: [
            Container(
              decoration: AppThemes.scaffoldBackgroundDecoration,
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSection(artisan: artisan),
                    Container(
                      height: 8,
                    ),
                    _buildProfileActions(loc),
                    const SizedBox(height: 8),
                    _buildWorkGallery(context, artisan.category, loc),
                    const SizedBox(height: 8),
                    _buildWorkingFields(context, artisan.category, loc),
                    const SizedBox(height: 8),
                    _buildProfessionalCertifs(context, loc),
                    const SizedBox(height: 8),
                    _buildServiceArea(context, loc),
                    const SizedBox(height: 8),
                    _buildWorkingHours(context, loc),
                    const SizedBox(height: 8),
                    _buildReviews(context, loc),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            _buildContactButton(hasToNavigateToFillDirectOrder, context, loc),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(AppLocalizations loc) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // Implement favorite logic
          },
        ),
      ],
      title: Text(
        loc.artisanProfileDetailsScreen_appBarTitle,
        style: const TextStyle(fontSize: 18),
      ),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildWorkingFields(
      BuildContext context, String artisanCategory, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.artisanProfileDetailsScreen_workingFields,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              fieldsByCategory[artisanCategory]!.length,
              (index) {
                return _workField(
                    context, ' ${fieldsByCategory[artisanCategory]![index]}');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _workField(BuildContext context, String field) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: AppColors.greyColor,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            field,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyColor,
                ),
          ),
        ],
      ),
    );
  }

  Positioned _buildContactButton(bool hasToNavigateToFillDirectOrder,
      BuildContext context, AppLocalizations loc) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (hasToNavigateToFillDirectOrder) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FillOfferDetailsScreen(
                    isDirectOffer: true,
                    isSendDirectly: true,
                  ),
                ),
              );
            } else {
              // Navigate to Fill Service Request screen
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.send,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Text(
                hasToNavigateToFillDirectOrder
                    ? loc.artisanProfileDetailsScreen_fillOfferAndSend
                    : loc.artisanProfileDetailsScreen_sendOffer,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildReviews(BuildContext context, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              loc.artisanProfileDetailsScreen_reviews,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildReview(
                context,
                'John Doe',
                'January 1, 2025',
                'Perfect service! He is so professional and quick response. I Would definitely recommend since he is so expert mashaallah.',
                5,
              ),
              Divider(
                height: 32,
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _buildReview(
                context,
                'Jane Smith',
                'February 15, 2025',
                'Great service! Very professional and quick response. Would definitely recommend.',
                4,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildWorkingHours(BuildContext context, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              loc.artisanProfileDetailsScreen_workingHours,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
          ),
          Column(
            children: [
              _WorkingHoursRow(
                day: loc.artisanProfileDetailsScreen_workingHours_monday,
                hours: loc.artisanProfileDetailsScreen_workingHours_hours,
              ),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(
                day: loc.artisanProfileDetailsScreen_workingHours_tuesday,
                hours: loc.artisanProfileDetailsScreen_workingHours_hours,
              ),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(
                day: loc.artisanProfileDetailsScreen_workingHours_wednesday,
                hours: loc.artisanProfileDetailsScreen_workingHours_hours,
              ),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(
                day: loc.artisanProfileDetailsScreen_workingHours_thursday,
                hours: loc.artisanProfileDetailsScreen_workingHours_hours,
              ),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(
                day: loc.artisanProfileDetailsScreen_workingHours_friday,
                hours: loc.artisanProfileDetailsScreen_workingHours_hours,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildServiceArea(BuildContext context, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.artisanProfileDetailsScreen_serviceArea,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/placeholders/location_picker_placeholder.webp',
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
          ),
        ],
      ),
    );
  }

  Container _buildProfessionalCertifs(
      BuildContext context, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.artisanProfileDetailsScreen_professionalCertificates,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.15),
              ),
            ),
            child: ListTile(
              title: Text(
                loc.artisanProfileDetailsScreen_certificate_title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
              ),
              subtitle: Text(
                loc.artisanProfileDetailsScreen_certificate_subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyColor,
                      fontSize: 14,
                    ),
              ),
              leading: const Icon(
                Icons.verified_rounded,
                color: AppColors.greyColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildWorkGallery(
      BuildContext context, String artisanCategory, AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Text(
              loc.artisanProfileDetailsScreen_workGallery,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    imagesByCategories[artisanCategory]!.length, (index) {
                  final image = imagesByCategories[artisanCategory]![index];
                  return GestureDetector(
                    onTap: () => showImageViewerDialog(context, image),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProfileActions(AppLocalizations loc) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {
              // Implement share profile logic
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
              foregroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.share,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 16),
                Text(
                  loc.artisanProfileDetailsScreen_shareProfile,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
              foregroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.qr_code,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 16),
                Text(
                  loc.artisanProfileDetailsScreen_qrCode,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview(
    BuildContext context,
    String name,
    String date,
    String reviewText,
    int stars,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.person,
            color: AppColors.greyColor,
            size: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.blackColor,
                          ),
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(stars, (index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    );
                  }),
                ),
                const SizedBox(height: 5),
                Text(
                  reviewText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.blackColor,
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

class _WorkingHoursRow extends StatelessWidget {
  const _WorkingHoursRow({
    required this.day,
    required this.hours,
  });

  final String day;
  final String hours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          Text(
            hours,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.greyColor,
                  fontSize: 14,
                ),
          ),
        ],
      ),
    );
  }
}
