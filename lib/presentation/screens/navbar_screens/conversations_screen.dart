import 'package:flutter/material.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/conversations_page/conversation_card.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: conversations.isEmpty
            ? const Center(
                child: Text(
                  'No conversations yet',
                  style: TextStyle(
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
                          'Conversations',
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

                  SizedBox(
                    height: 16,
                  ),

                  // text for conversations screen
                  Container(
                    margin: EdgeInsets.all(16),
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
                      hintText: 'Search for conversations',
                      fillColor: AppColors.whiteColor.withValues(alpha: .6),
                      prefixIcon: Icon(
                        LucideIcons.search,
                        size: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width - 24,
                    child: Text(
                      'Stay connected with your favorite artisans and clients. View, reply, and manage all your chats in one place for smooth, direct communication.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.greyColor,
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
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
