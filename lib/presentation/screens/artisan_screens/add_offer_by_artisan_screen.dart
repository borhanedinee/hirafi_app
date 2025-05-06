import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOfferByArtisanScreen extends StatefulWidget {
  const AddOfferByArtisanScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferByArtisanScreen> createState() =>
      _AddOfferByArtisanScreenState();
}

class _AddOfferByArtisanScreenState extends State<AddOfferByArtisanScreen> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            loc.addOfferByArtisanScreen_title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  loc.addOfferByArtisanScreen_heading,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.blackColor, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  loc.addOfferByArtisanScreen_subheading,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.greyColor,
                      ),
                ),
                const SizedBox(height: 16),
                // OFFER TITLE
                MyFieldHeader(
                    headingText: loc.addOfferByArtisanScreen_offerTitle),
                const SizedBox(height: 8),
                MyTextField(
                    hintText: loc.addOfferByArtisanScreen_offerTitleHint),
                const SizedBox(height: 16),
                // OFFER DESCRIPTION
                MyFieldHeader(
                    headingText: loc.addOfferByArtisanScreen_offerDescription),
                const SizedBox(height: 8),
                MyTextField(
                  hintText: loc.addOfferByArtisanScreen_offerDescriptionHint,
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                // OFFER TYPE
                MyFieldHeader(
                    headingText: loc.addOfferByArtisanScreen_offerType),
                const SizedBox(height: 16),
                _buildOfferTypeDropdownField(loc),
                const SizedBox(height: 16),
                // PRICE RANGE
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.addOfferByArtisanScreen_price,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.blackColor,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyFieldHeader(
                                  headingText: loc
                                      .addOfferByArtisanScreen_originalPrice),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: ((size.width - 32) / 2) - 20,
                                child: MyTextField(
                                  hintText: loc
                                      .addOfferByArtisanScreen_originalPriceHint,
                                  fillColor: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MyFieldHeader(
                                  headingText: loc
                                      .addOfferByArtisanScreen_discountedPrice),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: ((size.width - 32) / 2) - 20,
                                child: MyTextField(
                                  hintText: loc
                                      .addOfferByArtisanScreen_discountedPriceHint,
                                  fillColor: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // DISCOUNT FIELD
                      MyFieldHeader(
                        headingText: loc.addOfferByArtisanScreen_discount,
                      ),
                      const SizedBox(height: 8),
                      MyTextField(
                        hintText: loc.addOfferByArtisanScreen_discountHint,
                        fillColor: AppColors.whiteColor,
                        prefixIcon: const Icon(
                          Icons.discount_outlined,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // OFFER VALIDITY
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.addOfferByArtisanScreen_offerValidity,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.blackColor,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyFieldHeader(
                                  headingText:
                                      loc.addOfferByArtisanScreen_startDate),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: ((size.width - 32) / 2) - 20,
                                child: MyTextField(
                                  hintText:
                                      loc.addOfferByArtisanScreen_startDateHint,
                                  fillColor: AppColors.whiteColor,
                                  suffixIcon: const Icon(
                                    Icons.calendar_month,
                                    color: AppColors.blackColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MyFieldHeader(
                                  headingText:
                                      loc.addOfferByArtisanScreen_endDate),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: ((size.width - 32) / 2) - 20,
                                child: MyTextField(
                                  hintText:
                                      loc.addOfferByArtisanScreen_endDateHint,
                                  fillColor: AppColors.whiteColor,
                                  suffixIcon: const Icon(
                                    Icons.calendar_month,
                                    color: AppColors.blackColor,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // INFO
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            size: 20,
                            color: AppColors.greyColor.withValues(alpha: .7),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: size.width - 100,
                            child: Text(
                              loc.addOfferByArtisanScreen_validityInfo,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.greyColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // TARGETED AREAS
                MyFieldHeader(
                  headingText: loc.addOfferByArtisanScreen_targetedAreas,
                ),
                const SizedBox(height: 8),
                MyTextField(
                  hintText: loc.addOfferByArtisanScreen_targetedAreasHint,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 170,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loc.addOfferByArtisanScreen_targetedAreaExample,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.blackColor,
                            ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.close),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: size.width,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(loc.addOfferByArtisanScreen_postOfferButton),
                    icon: const Icon(
                      FontAwesomeIcons.paperPlane,
                      color: AppColors.whiteColor,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: size.width - 50,
                    child: Text(
                      loc.addOfferByArtisanScreen_postOfferInfo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.greyColor.withValues(alpha: .7),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getOfferTypes(AppLocalizations loc) {
    return [
      loc.addOfferByArtisanScreen_offerType_discount,
      loc.addOfferByArtisanScreen_offerType_freeService,
      loc.addOfferByArtisanScreen_offerType_package,
      loc.addOfferByArtisanScreen_offerType_limited,
      loc.addOfferByArtisanScreen_offerType_evaluation,
      loc.addOfferByArtisanScreen_offerType_warranty,
      loc.addOfferByArtisanScreen_offerType_urgent,
      loc.addOfferByArtisanScreen_offerType_gift,
      loc.addOfferByArtisanScreen_offerType_special,
      loc.addOfferByArtisanScreen_offerType_other,
    ];
  }

  String? _selectedOfferType;

  Widget _buildOfferTypeDropdownField(AppLocalizations loc) {
    return DropdownButtonFormField<String>(
      value: _selectedOfferType,
      hint: Text(
        loc.addOfferByArtisanScreen_offerTypeHint,
        style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: loc.addOfferByArtisanScreen_offerType,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _getOfferTypes(loc).map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedOfferType = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return loc.addOfferByArtisanScreen_offerType_validationError;
        }
        return null;
      },
    );
  }
}
