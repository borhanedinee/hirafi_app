import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isArtisan;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    required this.isArtisan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          hintText:
              'Search Services, Offers, ${isArtisan ? 'Artisans' : 'Clients'}...',
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.greyColor,
              ),
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
