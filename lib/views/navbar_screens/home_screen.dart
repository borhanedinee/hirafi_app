import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/constants/urls.dart';
import 'package:hirafi/utils/dummy_data.dart';
import 'package:hirafi/utils/enums/booking_status_enum.dart';
import 'package:hirafi/widgets/home_page/home_appbar.dart';
import 'package:hirafi/widgets/home_page/home_seacrhbar.dart';
import 'package:hirafi/widgets/home_page/recent_booking_card.dart';
import 'package:hirafi/widgets/home_page/recommendation_card.dart';
import 'package:hirafi/widgets/home_page/tip_card.dart';
import 'package:hirafi/widgets/home_page/top_rated_card.dart';
import 'package:hirafi/widgets/home_page/wrap_item.dart';
import 'package:hirafi/widgets/my_header.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
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
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: .96),
      drawer: const Drawer(),
      appBar: HomeAppBar(
        onMenuPressed: () {
          Scaffold.of(context).openDrawer();
        },
        onNotificationsPressed: () {},
      ),
      body: isLoading ? _buildShimmer() : _buildContent(),
    );
  }

  // Actual content when data is loaded
  Widget _buildContent() {
    final List<ArtisanModel> artisanDummyModels =
        artisanDummyData.map((e) => ArtisanModel.fromMap(e)).toList();

    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const CustomSearchBar(),
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
                        currentIndex = index;
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
                      width: currentIndex == index ? 10 : 6,
                      height: currentIndex == index ? 10 : 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
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

  // Shimmer effect while loading
  Widget _buildShimmer() {
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // Shimmer for Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Shimmer for Categories Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 20,
                  width: 120,
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for Categories Wrap
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10, top: 5),
                child: Row(
                  spacing: 15,
                  children: List.generate(5, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[50]!,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 60,
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            // Shimmer for Recent Orders Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 20,
                  width: 150,
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for Recent Orders
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 5),
                child: Row(
                  children: List.generate(4, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[50]!,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Container(
                          width: 200,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Shimmer for Top Rated Artisans Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 20,
                  width: 150,
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for Top Rated Artisans
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 15),
                child: Row(
                  children: List.generate(3, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[50]!,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Shimmer for Offers & Recommendations Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 20,
                  width: 200,
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for Offers & Recommendations Carousel
            Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Shimmer for Carousel Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[200]!,
                  highlightColor: Colors.grey[50]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            // Shimmer for Tips & Tricks Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
                child: Container(
                  height: 20,
                  width: 120,
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for Tips & Tricks
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: List.generate(2, (index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[50]!,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  }),
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
