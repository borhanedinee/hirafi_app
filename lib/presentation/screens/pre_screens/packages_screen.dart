import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/packages_page/package_card.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key, required this.isArtisan}) : super(key: key);

  final bool isArtisan;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width - 100,
                  child: Text(
                    'Choose your package',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                PackageCard(
                  planName: 'Free Package',
                  price: 'Free',
                  features: isArtisan
                      ? [
                          'Create and publish offers',
                          'Receive limited client requests',
                          'Basic profile visibility'
                        ]
                      : [
                          '4 requests per month',
                          'Basic support',
                          'Limited features'
                        ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 16),
                PackageCard(
                  isArtisan: isArtisan,
                  planName: 'Silver Package',
                  price: '500 DA',
                  features: isArtisan
                      ? [
                          'Higher profile ranking in search results',
                          'Receive more client requests per month',
                          'Access to work gallery uploads'
                        ]
                      : [
                          '15 requests per month',
                          'Bidding Access',
                          'All free features + Certified upload'
                        ],
                ),
                const SizedBox(height: 16),
                PackageCard(
                  planName: 'Gold Package',
                  price: '1500 DA',
                  features: isArtisan
                      ? [
                          'Priority profile visibility',
                          'Unlimited client requests',
                          'Direct messaging with clients'
                        ]
                      : [
                          'Unlimited requests',
                          'Top search priority',
                          'Advanced features',
                        ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 16),
                PackageCard(
                  planName: 'Premium Package',
                  price: '2500 DA',
                  features: isArtisan
                      ? [
                          'Top placement in artisan listings',
                          'Advanced analytics and insights',
                          'Featured in promotional campaigns'
                        ]
                      : [
                          'Top search spot',
                          'Home page promotions',
                          'Instant support',
                        ],
                  isArtisan: isArtisan,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
