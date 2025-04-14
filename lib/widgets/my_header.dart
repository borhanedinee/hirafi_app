import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/utils/app_colors.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
    required this.header,
    this.onViewAll,
    this.viewAll = true,
  });

  final String header;
  final bool viewAll;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          viewAll
              ? TextButton(
                  onPressed: onViewAll,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
