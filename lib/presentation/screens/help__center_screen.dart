import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart'; // Assuming you have AppColors defined

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  // Sample FAQ data (you can replace this with data from an API or database)
  final List<Map<String, String>> faqs = const [
    {
      'question': 'What is Herrafi?',
      'answer':
          'Herrafi is a mobile app that connects artisans with clients for unique creations. It allows clients to find skilled artisans for custom projects and enables artisans to showcase their work, receive direct offers, and manage their profiles. Features include user registration as either a client or artisan, a help center with FAQs, and a user-friendly interface to facilitate seamless interactions between artisans and clients.'
    },
    {
      'question': 'How do I register as an artisan?',
      'answer':
          'To register as an artisan, go to the user type screen and select "Join as an Artisan." Fill in your details, including your skills and work experience, and submit the form. Once approved, you can start receiving client requests.',
    },
    {
      'question': 'How can I contact a client?',
      'answer':
          'After accepting a direct offer from a client, you’ll be able to view their contact details in the offer details screen. You can then reach out via phone or email to discuss the project further.',
    },
    {
      'question': 'What happens if I reject an offer?',
      'answer':
          'If you reject an offer, it will be removed from your list of direct offers. The client will be notified, and they can choose to send the offer to another artisan.',
    },
    {
      'question': 'How do I update my profile?',
      'answer':
          'To update your profile, go to the profile section in the app. Tap on "Edit Profile," make the necessary changes (e.g., update your skills, contact info, or work samples), and save your changes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Help Center',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: AppThemes.scaffoldBackgroundDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                // HELP CENTER WELCOMING TEXT
                SizedBox(
                  width: size.width - 30,
                  child: Text(
                    'We\'re here to help you with anything and everything on Herrafi',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: size.width - 30,
                  child: Text(
                    'If you have any questions, concerns, or need assistance while using Herrafi, our team is ready to support you. Whether it’s about finding the right artisan, managing your orders, or understanding our services, we’ve got you covered. Browse our FAQs, reach out directly, or send us a message anytime — your satisfaction and comfort are our top priority.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                MyTextField(
                  hintText: 'Search help',
                  prefixIcon: Icon(
                    LucideIcons.search,
                    color: AppColors.greyColor,
                  ),
                ),

                SizedBox(
                  height: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FAQ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: faqs.length,
                      separatorBuilder: (context, index) => Divider(
                        color: AppColors.greyColor.withOpacity(0.5),
                      ),
                      itemBuilder: (context, index) {
                        return _buildFaqTile(
                          context,
                          question: faqs[index]['question']!,
                          answer: faqs[index]['answer']!,
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 32,
                ),
                // CONTACT US BUTTON
                SizedBox(
                  width: size.width - 30,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle contact us action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(
                      LucideIcons.mail,
                      color: AppColors.whiteColor,
                    ),
                    label: Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFaqTile(context,
      {required String question, required String answer}) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        question,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.greyColor,
            ),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      iconColor: AppColors.primaryColor,
      collapsedIconColor: AppColors.greyColor,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            answer,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                ),
          ),
        ),
      ],
    );
  }
}
