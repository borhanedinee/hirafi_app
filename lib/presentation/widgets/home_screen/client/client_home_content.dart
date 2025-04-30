import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/presentation/screens/client_screens/all_categories_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:hirafi/utils/enums/booking_status_enum.dart';
import 'package:hirafi/presentation/widgets/home_screen/home_seacrhbar.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/widgets/recent_booking_card.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/widgets/recommendation_card.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/widgets/tip_card.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/widgets/top_rated_card.dart';
import 'package:hirafi/presentation/widgets/home_screen/client/widgets/wrap_item.dart';
import 'package:hirafi/presentation/widgets/my_header.dart';

class ClientHomeContent extends StatefulWidget {
  const ClientHomeContent({super.key});

  @override
  State<ClientHomeContent> createState() => _ClientHomeContentState();
}

class _ClientHomeContentState extends State<ClientHomeContent> {
  int currentRecomendationIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final List<ArtisanModel> artisanDummyModels =
        artisanDummyData.map((e) => ArtisanModel.fromMap(e)).toList();

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const CustomSearchBar(),
            const SizedBox(height: 5),
            MyHeader(
              header: localizations.clientHomeContent_categories,
              onViewAll: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllCategoriesScreen(),
                  ),
                );
              },
            ),
            // WRAP CATEGORIES
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 5),
                child: Row(
                  spacing: 15,
                  children: [
                    WrapItem(
                      title: localizations.clientHomeContent_electrical,
                      icon: 'assets/icons/electrician.png',
                      index: 0,
                    ),
                    WrapItem(
                      title: localizations.clientHomeContent_plumbing,
                      icon: 'assets/icons/plumber.png',
                      index: 1,
                    ),
                    WrapItem(
                      title: localizations.clientHomeContent_carpentry,
                      icon: 'assets/icons/carpenter.png',
                      index: 2,
                    ),
                    WrapItem(
                      title: localizations.clientHomeContent_painture,
                      icon: 'assets/icons/painter.png',
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),
            // RECENT BOOKINGS
            MyHeader(header: localizations.clientHomeContent_yourRecentOrders),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 5),
                child: Row(
                  spacing: 14,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecentBookingCard(
                      onRebook: () {},
                      artisan: artisanDummyModels[0],
                      date: '12 Avril 2025 at 12:00 PM',
                      status: BookingStatus.pending,
                    ),
                    RecentBookingCard(
                      onRebook: () {},
                      artisan: artisanDummyModels[1],
                      date: '12 Avril 2025 at 12:00 PM',
                      status: BookingStatus.inProgress,
                    ),
                    RecentBookingCard(
                      onRebook: () {},
                      artisan: artisanDummyModels[2],
                      date: '12 Avril 2025 at 12:00 PM',
                      status: BookingStatus.waitingReply,
                    ),
                    RecentBookingCard(
                      onRebook: () {},
                      artisan: artisanDummyModels[3],
                      date: '12 Avril 2025 at 12:00 PM',
                      status: BookingStatus.completed,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // TOP RATED ARTISANS
            MyHeader(
              header: localizations.clientHomeContent_topRatedArtisans,
              viewAll: false,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 15),
                child: Row(
                  spacing: 20,
                  children: List.generate(
                    artisanDummyModels.length,
                    (index) {
                      final artisan = artisanDummyModels[index];
                      return TopRatedArtisanCard(artisan: artisan);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // OFFERS & RECOMMENDATIONS
            MyHeader(
                header:
                    localizations.clientHomeContent_offersAndRecommendations),
            Column(
              children: [
                CarouselSlider(
                  items: [
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[0],
                      availability:
                          localizations.clientHomeContent_availableNow,
                      distance:
                          localizations.clientHomeContent_distanceAway('2.5'),
                      description: localizations
                          .clientHomeContent_recommendationDescription(
                              'carpentry'),
                    ),
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[2],
                      availability:
                          localizations.clientHomeContent_availableNow,
                      distance:
                          localizations.clientHomeContent_distanceAway('2.2'),
                      description: localizations
                          .clientHomeContent_recommendationDescription(
                              'plumbing'),
                    ),
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[3],
                      availability:
                          localizations.clientHomeContent_availableNow,
                      distance:
                          localizations.clientHomeContent_distanceAway('6.5'),
                      description: localizations
                          .clientHomeContent_recommendationDescription(
                              'carpentry'),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 280,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentRecomendationIndex = index;
                      });
                    },
                    padEnds: true,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 3),
                      width: currentRecomendationIndex == index ? 10 : 6,
                      height: currentRecomendationIndex == index ? 10 : 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentRecomendationIndex == index
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                      ),
                    );
                  }),
                ),
              ],
            ),
            // TIPS & TRICKS
            MyHeader(header: localizations.clientHomeContent_tipsAndTricks),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    TipCard(
                      title: localizations
                          .clientHomeContent_howToChooseArtisanTitle,
                      description: localizations
                          .clientHomeContent_howToChooseArtisanDescription,
                      onReadMore: () {},
                    ),
                    TipCard(
                      title: localizations
                          .clientHomeContent_howToMaintainHomeTitle,
                      description: localizations
                          .clientHomeContent_howToMaintainHomeDescription,
                      onReadMore: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
