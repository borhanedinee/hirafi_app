import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/my_field_header.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';

class AddOfferByArtisanScreen extends StatefulWidget {
  const AddOfferByArtisanScreen({Key? key}) : super(key: key);

  @override
  State<AddOfferByArtisanScreen> createState() =>
      _AddOfferByArtisanScreenState();
}

class _AddOfferByArtisanScreenState extends State<AddOfferByArtisanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Offer to Clients',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                'Add a New Offer for Your Customers',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blackColor, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Create a special promotion to attract more clients.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.greyColor,
                    ),
              ),

              SizedBox(
                height: 16,
              ),

              // OFFER TITLE
              MyFieldHeader(headingText: 'Offer Title'),
              SizedBox(
                height: 8,
              ),
              MyTextField(
                  hintText:
                      'eg. 20% discount on electrical repairs this week.'),

              SizedBox(
                height: 16,
              ),

              // OFFER DESCRIPTION
              MyFieldHeader(headingText: 'Offer Description'),
              SizedBox(
                height: 8,
              ),
              MyTextField(
                hintText:
                    'eg. The offer appies to all electrical home maintenance services within aint temouchenet city.',
                maxLines: 4,
              ),

              SizedBox(
                height: 16,
              ),

              // OFFER TYPE
              MyFieldHeader(headingText: 'Offer Description'),
              SizedBox(
                height: 16,
              ),
              _buildSexDropdownField(),

              SizedBox(
                height: 16,
              ),

              // PRICE RANGE
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyFieldHeader(headingText: 'Original Price'),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: ((size.width - 32) / 2) - 20,
                              child: MyTextField(
                                hintText: 'eg. 5000DA',
                                fillColor: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MyFieldHeader(headingText: 'Price after discount'),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: ((size.width - 32) / 2) - 20,
                              child: MyTextField(
                                hintText: 'eg. 3000DA',
                                fillColor: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    // DISCOUNT FIELD
                    MyFieldHeader(
                      headingText: 'Discount',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    MyTextField(
                      hintText: 'eg, 25%',
                      fillColor: AppColors.whiteColor,
                      prefixIcon: Icon(
                        Icons.discount_outlined,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 16,
              ),

              // OFFER VALIDITY
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Offer Validity',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyFieldHeader(headingText: 'Start Date'),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: ((size.width - 32) / 2) - 20,
                              child: MyTextField(
                                hintText: '19/04/2025',
                                fillColor: AppColors.whiteColor,
                                suffixIcon: Icon(
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
                            MyFieldHeader(headingText: 'End Date'),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: ((size.width - 32) / 2) - 20,
                              child: MyTextField(
                                hintText: '26/04/2025',
                                fillColor: AppColors.whiteColor,
                                suffixIcon: Icon(
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

                    SizedBox(
                      height: 16,
                    ),

                    // INFO
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.info,
                          size: 20,
                          color: AppColors.greyColor.withValues(alpha: .7),
                        ),
                        SizedBox(
                          width: size.width - 100,
                          child: Text(
                            'Your offer will automatically expire after the end date.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.greyColor,
                                ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 16,
              ),

              // TARGETED AREAS
              MyFieldHeader(
                headingText: 'Targeted Areas',
              ),
              SizedBox(
                height: 8,
              ),
              MyTextField(
                hintText: 'Search for targeted areas for your offer',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 170,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ain Temochenet',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.blackColor,
                          ),
                    ),
                    Icon(
                      Icons.close,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 32,
              ),

              SizedBox(
                width: size.width,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Post Offer'),
                  icon: Icon(
                    FontAwesomeIcons.paperPlane,
                    color: AppColors.whiteColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),

              SizedBox(
                height: 8,
              ),
              Center(
                child: SizedBox(
                  width: size.width - 50,
                  child: Text(
                    'This offer will be displayed in the special offers section in client feed, and interested customers will contact you directly. ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor.withValues(alpha: .7),
                        ),
                  ),
                ),
              ),

              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _offerTypes = [
    "Discount on Price",
    "Free Additional Service",
    "Service Package",
    "Limited Time Offer",
    "Free Evaluation Visit",
    "Extra Warranty",
    "Urgent Service with No Extra Fees",
    "Free Gift with Service",
    "Special Offer for Families or Retirees",
    "Other"
  ];

  String? _selectedOfferType;

  Widget _buildSexDropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedOfferType,
      hint: const Text(
        'eg. Discount on price',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 14,
        ),
      ),
      decoration: InputDecoration(
        fillColor: AppColors.greyColor.withValues(alpha: .05),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        labelText: 'Select offer type',
        labelStyle: const TextStyle(color: AppColors.greyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor
                .withOpacity(0.2), // Light grey for unfocused border
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
      ),
      items: _offerTypes.map((category) {
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
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
