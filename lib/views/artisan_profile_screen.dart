import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

class ArtisanProfileScreen extends StatelessWidget {
  const ArtisanProfileScreen({
    super.key,
    required this.artisanName,
    required this.category,
    required this.avatar,
    this.isToSendOffer = false,
  });

  final String artisanName;
  final String category;
  final String avatar;
  final bool isToSendOffer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .96),
      appBar: AppBar(
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
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section

                _buildProfileSection(context),
                Container(
                  height: 8,
                ),
                // Profile Actions
                _buildProfileActions(),
                const SizedBox(height: 8),
                // Work Gallery
                _buildWorkGallery(context),
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
          _buildContactButton(isToSendOffer),
        ],
      ),
    );
  }

  Positioned _buildContactButton(bool isToSendOffer) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Implement contact logic
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
                isToSendOffer ? 'Send Offer' : 'Send Service',
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

  Container _buildWorkGallery(BuildContext context) {
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
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Image ${index + 1}',
                          style: const TextStyle(color: Colors.grey),
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

  Container _buildProfileSection(BuildContext context) {
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
                  avatar,
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
                      artisanName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.blackColor,
                          ),
                    ),
                    const SizedBox(height: 5),
                    // Category
                    Text(
                      category,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 5),
                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Annaba, Annaba', // Replace with actual location
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.greyColor,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Rating and Availability
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '4.9 (24 reviews)', // Replace with actual rating
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.greyColor,
                                    fontSize: 12,
                                  ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
