// lib/presentation/pages/fill_offer_details_screen.dart

import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/presentation/screens/client_screens/artisans_matching_screen.dart';
import 'package:hirafi/presentation/screens/client_screens/posted_offer_screen.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:ionicons/ionicons.dart';

class FillOfferDetailsScreen extends StatefulWidget {
  const FillOfferDetailsScreen(
      {super.key, required this.isDirectOffer, required this.isSendDirectly});

  final bool isDirectOffer;
  final bool isSendDirectly;

  @override
  State<FillOfferDetailsScreen> createState() => _FillOfferDetailsScreenState();
}

class _FillOfferDetailsScreenState extends State<FillOfferDetailsScreen> {
  final _budgetController = TextEditingController();
  final List<String> _categories = [
    'Plumbing',
    'Electrical',
    'Carpentry',
    'Painting',
    'Masonry',
  ];

  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // if (_formKey.currentState!.validate()) {}
    // Navigate based on offer type
    if (widget.isDirectOffer && !widget.isSendDirectly) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArtisansMatchingScreen(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostedSuccessfully(
            actionButtonText: 'Go to Home',
            description:
                'Your offer has been posted to the app. Artisans will contact you soon.',
            title: 'Offer Posted Successfully',
            onActionPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => NavBarRootScreen(
                    isArtisan: false,
                  ),
                ),
                (route) => route.isFirst,
              );
            },
          ),
        ),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white70,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        hintText:
            label, // Use hintText instead of labelText since we have a heading
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor
                .withOpacity(0.1), // Light grey for unfocused border
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      hint: const Text(
        'Select Category',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        labelText: 'Category',
        labelStyle: const TextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor
                .withOpacity(0.5), // Light grey for unfocused border
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _categories.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCategory = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fill Offer Details',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              decoration: AppThemes.scaffoldBackgroundDecoration,
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.isDirectOffer
                            ? 'Direct Offer Details.'
                            : 'Tender Offer Details.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(height: 20),
                      // Problem Title
                      Text(
                        'Problem Title',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _titleController,
                        label: 'e.g., Leaking Pipe',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a problem title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // Problem Description
                      Text(
                        'Problem Description',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _descriptionController,
                        label: 'Describe the issue in detail...',
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // Budget
                      Text(
                        'Budget',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _budgetController,
                        label: 'e.g., 3500 DZ',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a budget';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Working Hours',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _budgetController,
                        label: 'e.g., from 9:00 to 12:00',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a budget';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Category (no heading as per request)
                      _buildDropdownField(),
                      const SizedBox(height: 15),
                      // Pictures
                      Text(
                        'Upload Pictures',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(0.2),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: .3,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/placeholders/image_picker_placeholder.webp'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            // add icon
                            Positioned(
                              top: 20,
                              left: (size.width - 40 - 50) / 2,
                              child: Icon(
                                Icons.add_photo_alternate_rounded,
                                color:
                                    AppColors.greyColor.withValues(alpha: .6),
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Upload Video
                      Text(
                        'Upload Videos',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(0.2),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: .1,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/placeholders/image_picker_placeholder.webp'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: (size.width - 40 - 50) / 2,
                              child: Icon(
                                Icons.video_call,
                                color:
                                    AppColors.greyColor.withValues(alpha: .6),
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Location
                      Text(
                        'Your Location',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(0.2),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: .3,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/placeholders/location_picker_placeholder.webp'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            // add icon
                            Positioned(
                              top: 20,
                              left: (size.width - 40 - 50) / 2,
                              child: Icon(
                                Icons.add_location_alt,
                                color:
                                    AppColors.greyColor.withValues(alpha: .9),
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),

            // Next Button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      widget.isSendDirectly
                          ? Icon(
                              Icons.send,
                              color: Colors.white,
                            )
                          : SizedBox(),
                      Text(
                        widget.isSendDirectly ? 'Send Now' : 'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
