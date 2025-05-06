import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/core/constants/urls.dart';
import 'package:hirafi/core/dummy_data.dart';
import 'package:hirafi/presentation/screens/client_screens/artisan_profile_details_screen.dart';
import 'package:hirafi/presentation/widgets/app_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtisansMatchingScreen extends StatefulWidget {
  const ArtisansMatchingScreen({
    super.key,
  });

  @override
  State<ArtisansMatchingScreen> createState() => _ArtisansMatchingScreenState();
}

class _ArtisansMatchingScreenState extends State<ArtisansMatchingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final List<ArtisanModel> artisanDummyModels =
        artisanDummyData.map((e) => ArtisanModel.fromMap(e)).toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          title: Text(
            loc.artisansMatchingScreen_appBarTitle,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: isLoading
            ? _buildShimmer()
            : _buildContent(artisanDummyModels, loc),
      ),
    );
  }

  Widget _buildContent(
      List<ArtisanModel> artisanDummyModels, AppLocalizations loc) {
    return Container(
      decoration: AppThemes.scaffoldBackgroundDecoration,
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.artisansMatchingScreen_header,
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
                  childAspectRatio: 0.55,
                ),
                itemCount: artisanDummyModels.length,
                itemBuilder: (context, index) {
                  final artisan = artisanDummyModels[index];
                  return _buildArtisanCard(
                    context,
                    artisan: artisan,
                    loc: loc,
                    onCardClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => ArtisanProfileDetailsScreen(
                            artisan: artisan,
                          ),
                        ),
                      );
                    },
                    onSendOffer: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                width: 150,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.55,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[100]!,
                  child: AppCard(
                    onCardTapped: () {},
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              Container(
                                height: 16,
                                width: 80,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 12,
                                width: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
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
    required AppLocalizations loc,
    required VoidCallback onSendOffer,
    required VoidCallback onCardClicked,
  }) {
    return AppCard(
      onCardTapped: onCardClicked,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  artisan.avatar,
                  height: 120,
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
                Text(
                  loc.artisansMatchingScreen_joined
                      .replaceFirst('{years}', '1'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyColor,
                        fontSize: 12,
                      ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      loc.artisansMatchingScreen_distance
                          .replaceFirst('{distance}', '2.5'),
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
                      size: 16,
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
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onSendOffer,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                      foregroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      loc.artisansMatchingScreen_sendOffer,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
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
