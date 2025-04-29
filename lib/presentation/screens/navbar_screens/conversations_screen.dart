import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/conversations_screen/conversation_card.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> conversations = const [
    {
      'userName': 'Sara Ahmed',
      'timestamp': '2:45 PM',
      'messagePreview': 'I love the custom table you designed...',
      'category': 'Furniture',
      'unreadCount': 2,
      'avatar': 'assets/images/avatars/mason_avatar.webp',
    },
    {
      'userName': 'Ahmed Benali',
      'timestamp': '5:30 PM',
      'messagePreview': 'Can you start working on the carpentry project?',
      'category': 'Carpentry',
      'unreadCount': 1,
      'avatar': 'assets/images/avatars/car_avatar.jpeg',
    },
    {
      'userName': 'Aymen Khedir',
      'timestamp': 'Yesterday',
      'messagePreview': 'Thank you for the painting project!',
      'category': 'Painting',
      'unreadCount': 0,
      'avatar': 'assets/images/avatars/painter_avatar.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: conversations.isEmpty
            ? Center(
                child: Text(
                  loc.conversationsScreen_emptyState,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.greyColor,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // APP BAR
                  Container(
                    height: 60,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          loc.conversationsScreen_title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.greyColor.withOpacity(0.5),
                    height: 1,
                  ),
                  // SEARCH BAR
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: MyTextField(
                      hintText: loc.conversationsScreen_searchHint,
                      fillColor: AppColors.whiteColor.withValues(alpha: .6),
                      prefixIcon: const Icon(
                        LucideIcons.search,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width - 24,
                    child: Text(
                      loc.conversationsScreen_description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: conversations.length,
                    separatorBuilder: (context, index) => Divider(
                      color: AppColors.greyColor.withOpacity(0.5),
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final conversation = conversations[index];
                      return ConversationCard(
                        avatar: conversation['avatar'] as String,
                        userName: conversation['userName'] as String,
                        timestamp: conversation['timestamp'] as String,
                        messagePreview:
                            conversation['messagePreview'] as String,
                        category: conversation['category'] as String,
                        unreadCount: conversation['unreadCount'] as int,
                        onTap: () {
                          // Navigate to chat screen with the user
                          print(
                              'Tapped on conversation with ${conversation['userName']}');
                        },
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
