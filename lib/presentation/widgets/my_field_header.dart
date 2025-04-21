import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

class MyFieldHeader extends StatelessWidget {
  const MyFieldHeader({super.key, required this.headingText, this.color});

  final String headingText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: color ?? AppColors.blackColor.withValues(alpha: .8),
            fontSize: 13,
          ),
    );
  }
}
