import 'package:flutter/material.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/presentation/screens/home_sub_screens/sub_categories_screen.dart';

class WrapItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;

  final int index;

  const WrapItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SubCategoriesScreen(
                  clickedCategory: title,
                  index: index,
                ),
              ),
            );
          },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80,
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                icon,
                color: AppColors.blackColor,
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
