import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:hirafi/utils/enums/booking_status_enum.dart';
import 'package:hirafi/presentation/widgets/home_page/home_seacrhbar.dart';
import 'package:hirafi/presentation/widgets/home_page/client/widgets/recent_booking_card.dart';
import 'package:hirafi/presentation/widgets/home_page/client/widgets/recommendation_card.dart';
import 'package:hirafi/presentation/widgets/home_page/client/widgets/tip_card.dart';
import 'package:hirafi/presentation/widgets/home_page/client/widgets/top_rated_card.dart';
import 'package:hirafi/presentation/widgets/home_page/client/widgets/wrap_item.dart';
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
            const CustomSearchBar(
              isArtisan: false,
            ),
            const SizedBox(height: 5),
            const MyHeader(header: 'Categories'),
            // WRAP CATEGORIES
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 5),
                child: Row(
                  spacing: 15,
                  children: const [
                    WrapItem(
                      title: 'Electrical',
                      icon: 'assets/icons/electrician.png',
                    ),
                    WrapItem(
                      title: 'Plumbing',
                      icon: 'assets/icons/plumber.png',
                    ),
                    WrapItem(
                      title: 'Carpentry',
                      icon: 'assets/icons/carpenter.png',
                    ),
                    WrapItem(
                      title: 'Painture',
                      icon: 'assets/icons/painter.png',
                    ),
                  ],
                ),
              ),
            ),
            // RECENT BOOKINGS
            const MyHeader(header: 'Your Recent Orders'),
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
            const MyHeader(
              header: 'Top Rated Artisans',
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
            const MyHeader(header: 'Offers & Recommendations'),
            Column(
              children: [
                CarouselSlider(
                  items: [
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[0],
                      availability: 'Available Now',
                      distance: '2.5km away',
                      description:
                          'Get 20% off carpentry services this week – perfect time to fix that old closet or build new shelves.',
                    ),
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[2],
                      availability: 'Available Now',
                      distance: '2.2km away',
                      description:
                          'Get 20% off plumbing services this week – perfect time to fix that old closet or build new shelves.',
                    ),
                    RecommendationCard(
                      onBookNow: () {},
                      artisan: artisanDummyModels[3],
                      availability: 'Available Now',
                      distance: '6.5km away',
                      description:
                          'Get 20% off carpentry services this week – perfect time to fix that old closet or build new shelves.',
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
            const MyHeader(header: 'Tips & Tricks'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    TipCard(
                      title: 'How to choose the right artisan',
                      description:
                          'Choosing the right artisan can be a daunting task. Here are some tips to help you make the right choice.',
                      onReadMore: () {},
                    ),
                    TipCard(
                      title: 'How to maintain your home',
                      description:
                          'Maintaining your home is essential for its longevity. Here are some tips to help you keep your home in top shape.',
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
