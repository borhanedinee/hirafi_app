import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Sample payment methods data (relevant for Algeria)
    final List<Map<String, dynamic>> paymentMethods = [
      {
        'icon': FontAwesomeIcons.creditCard,
        'name': l10n.paymentMethodsScreen_cibCard_name,
        'description': l10n.paymentMethodsScreen_cibCard_description,
        'color': Colors.blue,
      },
      {
        'icon': FontAwesomeIcons.wallet,
        'name': l10n.paymentMethodsScreen_edahabia_name,
        'description': l10n.paymentMethodsScreen_edahabia_description,
        'color': Colors.green,
      },
      {
        'icon': FontAwesomeIcons.moneyBill,
        'name': l10n.paymentMethodsScreen_cashOnDelivery_name,
        'description': l10n.paymentMethodsScreen_cashOnDelivery_description,
        'color': Colors.orange,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.paymentMethodsScreen_title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 2,
      ),
      body: Container(
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              // HEADER
              SizedBox(
                width: size.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.paymentMethodsScreen_manageOptions,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      l10n.paymentMethodsScreen_description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 32,
              ),

              // Payment Methods List
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return _buildPaymentMethodTile(
                      icon: paymentMethods[index]['icon'] as IconData,
                      name: paymentMethods[index]['name'] as String,
                      description:
                          paymentMethods[index]['description'] as String,
                      color: paymentMethods[index]['color'] as Color,
                    );
                  },
                ),
              ),

              // Add Payment Method Button
              Container(
                width: size.width,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to Add Payment Method screen
                    print('Add Payment Method tapped');
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    l10n.paymentMethodsScreen_addPaymentMethod,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: AppColors.primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required IconData icon,
    required String name,
    required String description,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Name and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Trailing Icon (for interaction)
            Icon(
              Icons.chevron_right,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
