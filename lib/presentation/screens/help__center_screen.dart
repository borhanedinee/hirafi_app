import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key, required this.isArtisan});

  final bool isArtisan;

  // FAQ data sourced from AppLocalizations
  List<Map<String, String>> _getFAQs(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    if (isArtisan) {
      return [
        {
          'question': loc.helpCenterScreen_artisanFaq1Question,
          'answer': loc.helpCenterScreen_artisanFaq1Answer,
        },
        {
          'question': loc.helpCenterScreen_artisanFaq2Question,
          'answer': loc.helpCenterScreen_artisanFaq2Answer,
        },
        {
          'question': loc.helpCenterScreen_artisanFaq3Question,
          'answer': loc.helpCenterScreen_artisanFaq3Answer,
        },
        {
          'question': loc.helpCenterScreen_artisanFaq4Question,
          'answer': loc.helpCenterScreen_artisanFaq4Answer,
        },
        {
          'question': loc.helpCenterScreen_artisanFaq5Question,
          'answer': loc.helpCenterScreen_artisanFaq5Answer,
        },
      ];
    } else {
      return [
        {
          'question': loc.helpCenterScreen_clientFaq1Question,
          'answer': loc.helpCenterScreen_clientFaq1Answer,
        },
        {
          'question': loc.helpCenterScreen_clientFaq2Question,
          'answer': loc.helpCenterScreen_clientFaq2Answer,
        },
        {
          'question': loc.helpCenterScreen_clientFaq3Question,
          'answer': loc.helpCenterScreen_clientFaq3Answer,
        },
        {
          'question': loc.helpCenterScreen_clientFaq4Question,
          'answer': loc.helpCenterScreen_clientFaq4Answer,
        },
        {
          'question': loc.helpCenterScreen_clientFaq5Question,
          'answer': loc.helpCenterScreen_clientFaq5Answer,
        },
        {
          'question': loc.helpCenterScreen_clientFaq6Question,
          'answer': loc.helpCenterScreen_clientFaq6Answer,
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final faqs = _getFAQs(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            loc.helpCenterScreen_helpCenterTitle,
            style: const TextStyle(
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
                const SizedBox(height: 32),
                // HELP CENTER WELCOMING TEXT
                SizedBox(
                  width: size.width - 30,
                  child: Text(
                    loc.helpCenterScreen_welcomeText,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.blackColor,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: size.width - 30,
                  child: Text(
                    loc.helpCenterScreen_supportText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                MyTextField(
                  hintText: loc.helpCenterScreen_searchHint,
                  prefixIcon: const Icon(
                    LucideIcons.search,
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.helpCenterScreen_faqTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.blackColor),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                const SizedBox(height: 32),
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
                    icon: const Icon(
                      LucideIcons.mail,
                      color: AppColors.whiteColor,
                    ),
                    label: Text(
                      loc.helpCenterScreen_contactUsButton,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
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
