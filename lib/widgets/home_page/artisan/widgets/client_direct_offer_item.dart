import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';

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
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.asset(
                  'assets/images/avatars/plumber_avatar.jpeg',
                  width: 48,
                  height: 48,
                ),
              ),
              SizedBox(
                width: 12,
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
                  Text(
                    'Annaba, Annaba',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              // offer sent time
              Text(
                '2h ago',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 16,
          ),

          // OFFER TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'I need a plumber to fix my sink',
              style: Theme.of(context).textTheme.titleSmall,
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
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 8,
                  ),
                  shadowColor: AppColors.primaryColor,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Accept',
                ),
              ),
              ElevatedButton(
                onPressed: onReject,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    const EdgeInsets.symmetric(
                      horizontal: 48,
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
                  'Refuse',
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
