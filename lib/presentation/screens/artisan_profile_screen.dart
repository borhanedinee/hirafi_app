import 'package:flutter/material.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:hirafi/presentation/screens/fill_offer_screen.dart';
import 'package:hirafi/presentation/widgets/artisan_profile_page/profile_section.dart';

class ArtisanProfileScreen extends StatelessWidget {
  const ArtisanProfileScreen({
    super.key,
    required this.artisan,
    this.hasToNavigateToFillDirectOrder = false,
  });
  final bool hasToNavigateToFillDirectOrder;
  final ArtisanModel artisan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .96),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                ProfileSection(artisan: artisan),
                Container(
                  height: 8,
                ),
                // Profile Actions
                _buildProfileActions(),
                const SizedBox(height: 8),
                // Work Gallery
                _buildWorkGallery(context, artisan.category),
                const SizedBox(height: 8),
                // Working Fileds
                _buildWorkingFields(context, artisan.category),
                const SizedBox(height: 8),

                // Professional Certificates
                _buildProfessionalCertifs(context),
                const SizedBox(height: 8),
                // Service Area
                _buildServiceArea(context),
                const SizedBox(height: 8),
                // Working Hours
                _buildWorkingHours(context),
                const SizedBox(height: 8),
                // Reviews
                _buildReviews(context),

                const SizedBox(height: 80),
              ],
            ),
          ),

          // Contact Artisan Button
          _buildContactButton(hasToNavigateToFillDirectOrder, context),
        ],
      ),
    );
  }

  // Function to show the image viewer dialog
  void _showImageViewerDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              // Image viewer with zooming
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              // Close button
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // Implement favorite logic
          },
        ),
      ],
      title: const Text(
        'Artisan Profile',
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildWorkingFields(context, artisanCategory) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Working Fields',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              fieldsByCategory[artisanCategory]!.length,
              (index) {
                return _workField(
                    context, '-  ${fieldsByCategory[artisanCategory]![index]}');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _workField(context, field) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Text(
        field,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.greyColor,
            ),
      ),
    );
  }

  Positioned _buildContactButton(
      bool hasToNavigateToFillDirectOrder, BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (hasToNavigateToFillDirectOrder) {
              // Navigate to Fill Direct Order screen
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
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.send,
                color: Colors.white,
              ),
              Text(
                hasToNavigateToFillDirectOrder
                    ? 'Fill Offer and Send'
                    : 'Send Offer',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildReviews(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Reviews',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              // Review 1
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
              // Review 2
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

  Container _buildWorkingHours(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Working Hours',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
            ),
          ),
          Column(
            children: [
              _WorkingHoursRow(day: 'Monday', hours: '9:00 AM - 5:00 PM'),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(day: 'Tuesday', hours: '9:00 AM - 5:00 PM'),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(day: 'Wednesday', hours: '9:00 AM - 5:00 PM'),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(day: 'Thursday', hours: '9:00 AM - 5:00 PM'),
              Divider(
                color: AppColors.greyColor.withValues(alpha: .2),
              ),
              _WorkingHoursRow(day: 'Friday', hours: '9:00 AM - 5:00 PM'),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildServiceArea(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Area',
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

  Container _buildProfessionalCertifs(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Professional Certificates',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.blackColor,
                ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.greyColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.15),
              ),
            ),
            child: ListTile(
              title: Text(
                'Master Plumber License',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
              ),
              subtitle: Text(
                'Certified by NY State - Expires 2025',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyColor,
                      fontSize: 14,
                    ),
              ),
              leading: const Icon(
                Icons.verified_rounded,
                color: AppColors.greyColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildWorkGallery(BuildContext context, artisanCategory) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
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
              'Work Gallery',
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
                    onTap: () => _showImageViewerDialog(context, image),
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

  Container _buildProfileActions() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
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
                const Text(
                  'Share Profile',
                  style: TextStyle(
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
                const Text(
                  'QR Code',
                  style: TextStyle(
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

// Helper widget for Working Hours rows
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
