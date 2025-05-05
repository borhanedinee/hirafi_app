import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Added for localization

class ClientDirectOfferItem extends StatelessWidget {
  const ClientDirectOfferItem({
    super.key,
    required this.onAccept,
    required this.onReject,
  });

  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //icon and name and city
          Row(
            children: [
              // AVATAR
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 21,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(52),
                  child: Image.asset(
                    'assets/images/avatars/client_avatar.jpg',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),

              // ARTISAN NAME AND RATING
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAME
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  // CITY
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: AppColors.greyColor,
                        size: 12,
                      ),
                      Text(
                        'Ain Temouchent',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  // POSTED TIME
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        size: 12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '2h ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  // ARTISAN CATEGORY
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.searchengin,
                          color: Colors.green,
                          size: 12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Plumber',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 16,
          ),

          // OFFER TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'I need a plumber to fix my sink ...',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.greyColor,
                      ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: AppColors.greyColor,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          // STATUS URGENT ETC
          Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Urgent',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                  ),
            ),
          ),

          SizedBox(
            height: 16,
          ),

          // BUDGET
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.moneyBill,
                  color: AppColors.greyColor,
                  size: 14,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Budget:  ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  '1000 DA - 3000 DA',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),

          // TIME NEEDED
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: AppColors.greyColor,
                  size: 14,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Needed:  ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  '24 April 2025',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyColor,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),

          // ACTIONS ACCEPT OR REJECT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: onAccept,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 52,
                    vertical: 8,
                  ),
                  shadowColor: AppColors.primaryColor,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.clientDirectOfferItem_accept,
                  style: TextStyle(
                    color:
                        Colors.white, // Ensure text is visible on primary color
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onReject,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    const EdgeInsets.symmetric(
                      horizontal: 52,
                      vertical: 8,
                    ),
                  ),
                  shadowColor: WidgetStatePropertyAll(AppColors.primaryColor),
                  backgroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: AppColors.greyColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.clientDirectOfferItem_refuse,
                  style: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
