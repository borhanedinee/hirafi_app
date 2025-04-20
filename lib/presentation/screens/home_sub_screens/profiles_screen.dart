// lib/presentation/pages/artisanDummyData_matching_screen.dart
import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/constants/urls.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:hirafi/presentation/screens/client_screens/artisan_profile_screen.dart';
import 'package:hirafi/presentation/widgets/app_card.dart';
import 'package:shimmer/shimmer.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key, required this.clickedSubCategory});
  final String clickedSubCategory;

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  bool isLoading = true; // Add loading state

  @override
  void initState() {
    super.initState();
    // Simulate a data fetch (e.g., from an API)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Set loading to false after data is "fetched"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ArtisanModel> artisanDummyModels =
        artisanDummyData.map((e) => ArtisanModel.fromMap(e)).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'Profiles',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: isLoading ? _buildShimmer() : _buildContent(artisanDummyModels),
    );
  }

  // Actual content when data is loaded
  Widget _buildContent(List<ArtisanModel> artisanDummyModels) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.clickedSubCategory} artisanDummyData.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.55, // Adjusted to prevent overflow
              ),
              itemCount: artisanDummyModels.length,
              itemBuilder: (context, index) {
                final artisan = artisanDummyModels[index];
                return _buildArtisanCard(
                  context,
                  artisan: artisan,
                  onCardTapped: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => ArtisanProfileScreen(
                          artisan: artisan,
                          hasToNavigateToFillDirectOrder: true,
                        ),
                      ),
                    );
                  },
                  onContactArtisan: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Shimmer effect while loading
  Widget _buildShimmer() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for Header
            Shimmer.fromColors(
              baseColor: Colors.grey[200]!, // Use grey[200] as requested
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                width: 150,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Shimmer for GridView
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.55, // Match the actual GridView
              ),
              itemCount: 4, // Show 4 shimmer placeholders
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[200]!, // Use grey[200] as requested
                  highlightColor: Colors.grey[100]!,
                  child: AppCard(
                    onCardTapped: () {},
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image placeholder
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name placeholder
                              Container(
                                height: 16,
                                width: 80,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              // Category placeholder
                              Container(
                                height: 12,
                                width: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              // Stars placeholder
                              Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 12,
                                    width: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Button placeholder
                              Container(
                                height: 36,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildArtisanCard(
    BuildContext context, {
    required ArtisanModel artisan,
    required VoidCallback onContactArtisan,
    required VoidCallback onCardTapped,
  }) {
    return AppCard(
      onCardTapped: onCardTapped,
      padding: const EdgeInsets.all(
          0), // Remove padding from AppCard to control it manually
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with gradient overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  artisan.avatar,
                  height: 120, // Adjusted height to fit better
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 5),
                Text(
                  artisan.fullName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                // Joined App Period
                Text(
                  'Joined 1 year ago', // Replace with actual join date
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyColor,
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 5),
                // Nearby Section
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '2.5 km away', // Replace with actual distance
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16, // Reduced size
                    ),
                    const SizedBox(width: 5),
                    Text(
                      artisan.stars.toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onContactArtisan,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                      foregroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'View Details',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // Slightly smaller font
                          ),
                    ),
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
