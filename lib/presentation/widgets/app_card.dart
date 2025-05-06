import 'package:flutter/material.dart';
import 'package:hirafi/core/themes/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final GestureTapCallback onCardTapped;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(15),
    this.borderRadius = 20.0,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
