import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/screens/navbar_root_screen.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/presentation/screens/client_screens/artisans_matching_screen.dart';
import 'package:hirafi/presentation/screens/client_screens/posted_offer_screen.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FillOfferDetailsScreen extends StatefulWidget {
  const FillOfferDetailsScreen({
    super.key,
    required this.isDirectOffer,
    required this.isSendDirectly,
  });

  final bool isDirectOffer;
  final bool isSendDirectly;

  @override
  State<FillOfferDetailsScreen> createState() => _FillOfferDetailsScreenState();
}

class _FillOfferDetailsScreenState extends State<FillOfferDetailsScreen> {
  final _budgetController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final _titleController = TextEditingController();

  List<String> _getCategories(AppLocalizations loc) {
    return [
      loc.fillOfferDetailsScreen_category_plumbing,
      loc.fillOfferDetailsScreen_category_electrical,
      loc.fillOfferDetailsScreen_category_carpentry,
      loc.fillOfferDetailsScreen_category_painting,
      loc.fillOfferDetailsScreen_category_masonry,
    ];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigate based on offer type
      if (widget.isDirectOffer && !widget.isSendDirectly) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtisansMatchingScreen(),
          ),
        );
      } else {
        final loc = AppLocalizations.of(context)!;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostedSuccessfully(
              actionButtonText: loc.fillOfferDetailsScreen_postedActionButton,
              description: loc.fillOfferDetailsScreen_postedDescription,
              title: loc.fillOfferDetailsScreen_postedTitle,
              onActionPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => NavBarRootScreen(),
                  ),
                  (route) => route.isFirst,
                );
              },
            ),
          ),
        );
      }
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String validationMessage,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? additionalValidationMessage,
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
        hintText: label,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        if (additionalValidationMessage != null &&
            keyboardType == TextInputType.number &&
            double.tryParse(value) == null) {
          return additionalValidationMessage;
        }
        return null;
      },
    );
  }

  Widget _buildDropdownField(AppLocalizations loc) {
    return DropdownButtonFormField<String>(
      value: _selectedCategory,
      hint: Text(
        loc.fillOfferDetailsScreen_categoryHint,
        style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        labelText: loc.fillOfferDetailsScreen_category,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _getCategories(loc).map((category) {
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
          return loc.fillOfferDetailsScreen_categoryValidation;
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            loc.fillOfferDetailsScreen_appBarTitle,
            style: const TextStyle(
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
                            ? loc.fillOfferDetailsScreen_directOfferHeading
                            : loc.fillOfferDetailsScreen_tenderOfferHeading,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.blackColor,
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(height: 20),
                      // Problem Title
                      Text(
                        loc.fillOfferDetailsScreen_problemTitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _titleController,
                        label: loc.fillOfferDetailsScreen_problemTitleHint,
                        validationMessage:
                            loc.fillOfferDetailsScreen_problemTitleValidation,
                      ),
                      const SizedBox(height: 15),
                      // Problem Description
                      Text(
                        loc.fillOfferDetailsScreen_problemDescription,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _descriptionController,
                        label:
                            loc.fillOfferDetailsScreen_problemDescriptionHint,
                        validationMessage: loc
                            .fillOfferDetailsScreen_problemDescriptionValidation,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 15),
                      // Budget
                      Text(
                        loc.fillOfferDetailsScreen_budget,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _budgetController,
                        label: loc.fillOfferDetailsScreen_budgetHint,
                        validationMessage:
                            loc.fillOfferDetailsScreen_budgetValidationEmpty,
                        keyboardType: TextInputType.number,
                        additionalValidationMessage:
                            loc.fillOfferDetailsScreen_budgetValidationInvalid,
                      ),
                      const SizedBox(height: 15),
                      // Working Hours
                      Text(
                        loc.fillOfferDetailsScreen_workingHours,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.greyColor,
                            ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _budgetController,
                        label: loc.fillOfferDetailsScreen_workingHoursHint,
                        validationMessage:
                            loc.fillOfferDetailsScreen_workingHoursValidation,
                      ),
                      const SizedBox(height: 20),
                      // Category
                      _buildDropdownField(loc),
                      const SizedBox(height: 15),
                      // Pictures
                      Text(
                        loc.fillOfferDetailsScreen_uploadPictures,
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
                        loc.fillOfferDetailsScreen_uploadVideos,
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
                        loc.fillOfferDetailsScreen_location,
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
                    children: [
                      if (widget.isSendDirectly)
                        const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      if (widget.isSendDirectly) const SizedBox(width: 16),
                      Text(
                        !widget.isDirectOffer
                            ? loc.fillOfferDetailsScreen_sendNowButton
                            : loc.fillOfferDetailsScreen_nextButton,
                        style: const TextStyle(
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
