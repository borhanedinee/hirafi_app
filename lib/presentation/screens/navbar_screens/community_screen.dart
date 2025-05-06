import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/models/community_group_model.dart';
import 'package:hirafi/models/post_model.dart';
import 'package:hirafi/models/user_model.dart';
import 'package:hirafi/presentation/controller/global_data_controller.dart';
import 'package:hirafi/presentation/widgets/community_screen/dialogs/show_add_group_dialog_artisan.dart';
import 'package:hirafi/presentation/widgets/community_screen/dialogs/show_add_group_dialog_client.dart';
import 'package:hirafi/presentation/widgets/community_screen/group_item.dart';
import 'package:hirafi/presentation/widgets/community_screen/post_item.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:hirafi/core/dummy_data.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  UserModel user3 = UserModel(
    uid: '3',
    name: 'Ahmed Benali',
    email: 'ahmed@example.com',
    phone: '0551234567',
    gender: 'Male',
    location: 'Tlemcen, Algeria',
    profileImage: 'assets/images/avatars/mason_avatar.webp',
  );

  UserModel user4 = UserModel(
    uid: '4',
    name: 'Fatima Zohra',
    email: 'fatima@example.com',
    phone: '0779876543',
    gender: 'Female',
    location: 'Ain Temouchent',
  );

  UserModel user5 = UserModel(
    uid: '5',
    name: 'Karim Haddad',
    email: 'karim@example.com',
    phone: '0665432109',
    gender: 'Male',
    location: 'Constantine, Algeria',
    profileImage: 'assets/images/avatars/electrician_avatar.jpg',
  );

  UserModel user6 = UserModel(
    uid: '6',
    name: 'Lina Merad',
    email: 'lina@example.com',
    phone: '0798765432',
    gender: 'Female',
    location: 'Blida, Algeria',
  );

  @override
  Widget build(BuildContext context) {
    List<GroupModel> groups = [
      GroupModel(
        id: '1',
        name:
            AppLocalizations.of(context)!.communityScreen_valueCategoryPlumbing,
        description: AppLocalizations.of(context)!
            .communityScreen_valuePlumbingGroupDescription,
        category: 'Plumbing',
        icon: Icons.plumbing,
        color: Colors.teal,
        members: 245,
        recentActivity: '5 new posts this week',
      ),
      GroupModel(
        id: '2',
        name: AppLocalizations.of(context)!
            .communityScreen_valueCategoryElectrical,
        description: AppLocalizations.of(context)!
            .communityScreen_valueElectricalGroupDescription,
        category: 'Electrical',
        icon: Icons.electrical_services,
        color: Colors.orange,
        members: 180,
        recentActivity: '3 new posts today',
      ),
      GroupModel(
        id: '3',
        name: AppLocalizations.of(context)!
            .communityScreen_valueCategoryCarpentry,
        description: AppLocalizations.of(context)!
            .communityScreen_valueCarpentryGroupDescription,
        category: 'Carpentry',
        icon: Icons.build,
        color: Colors.brown,
        members: 320,
        recentActivity: '10 new posts this week',
      ),
      GroupModel(
        id: '4',
        name:
            AppLocalizations.of(context)!.communityScreen_valueCategoryPainting,
        description: AppLocalizations.of(context)!
            .communityScreen_valuePaintingGroupDescription,
        category: 'Painting',
        icon: Icons.format_paint,
        color: Colors.blue,
        members: 150,
        recentActivity: '2 new posts today',
      ),
    ];
    List<PostModel> additionalPosts = [
      PostModel(
        id: '3',
        user: user3,
        content:
            'Just finished a custom wooden bookshelf for a client in Tlemcen. The natural wood finish looks amazing! Any tips for sealing it to last longer?',
        imageUrl: 'assets/images/avatars/carpenter_post.jpg',
        category: 'Carpentry',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        likes: 15,
        comments: 5,
        shares: 2,
      ),
      PostModel(
        id: '4',
        user: user4,
        content:
            'Looking for an electrician in Ain Temouchent to fix some wiring issues in my house. It’s urgent—can anyone recommend someone reliable?',
        category: 'Electrical',
        timestamp: DateTime.now().subtract(const Duration(hours: 10)),
        likes: 7,
        comments: 9,
        shares: 1,
      ),
      PostModel(
        id: '5',
        user: user5,
        content:
            'Installed a new bathroom sink for a client today. Used ceramic tiles for the backsplash—turned out great! What’s your favorite material for bathroom renovations?',
        imageUrl: 'assets/images/avatars/plumbing_post.jpeg',
        category: 'Plumbing',
        timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
        likes: 30,
        comments: 12,
        shares: 4,
      ),
      PostModel(
        id: '6',
        user: user6,
        content:
            'Need a painter in Blida to repaint my living room. I’m thinking of a light blue color—any suggestions for complementary shades?',
        category: 'Painting',
        timestamp:
            DateTime.now().subtract(const Duration(hours: 2, minutes: 15)),
        likes: 4,
        comments: 6,
        shares: 0,
      ),
      PostModel(
        id: '7',
        user: user3,
        content:
            'Built a pergola for a garden in Tlemcen. The client wanted a rustic look, so I used reclaimed wood. What do you think of the design?',
        imageUrl: 'assets/images/avatars/carpenter_post.jpg',
        category: 'Carpentry',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        likes: 22,
        comments: 10,
        shares: 3,
      ),
      PostModel(
        id: '8',
        user: user5,
        content:
            'Fixed a major pipe burst for a client in Constantine. It was a challenging job, but we got it done! Any plumbers here have tips for preventing pipe corrosion?',
        category: 'Plumbing',
        timestamp: DateTime.now().subtract(const Duration(hours: 6)),
        likes: 18,
        comments: 7,
        shares: 2,
      ),
    ];

    // Helper function to get localized category name
    String getLocalizedCategory(String category) {
      switch (category.toLowerCase()) {
        case 'carpentry':
          return AppLocalizations.of(context)!
              .communityScreen_valueCategoryCarpentry;
        case 'electrical':
          return AppLocalizations.of(context)!
              .communityScreen_valueCategoryElectrical;
        case 'plumbing':
          return AppLocalizations.of(context)!
              .communityScreen_valueCategoryPlumbing;
        case 'painting':
          return AppLocalizations.of(context)!
              .communityScreen_valueCategoryPainting;
        default:
          return category; // Fallback to the original category name if not localized
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: AppThemes.scaffoldBackgroundDecoration,
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // APP BAR
              Container(
                height: 60,
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .communityScreen_valueAppBarTitle,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MyTextField(
                          hintText: AppLocalizations.of(context)!
                              .communityScreen_valueSearchHint,
                          prefixIcon: Icon(
                            LucideIcons.search,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      // Groups Grid
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .communityScreen_valueHeadingsGroups,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Spacer(),
                                  TextButton.icon(
                                    onPressed: () {
                                      Get.find<GlobalDataController>()
                                              .isArtisan!
                                          ? showAddGroupArtisanDialog(context)
                                          : showAddGroupClientDialog(context);
                                    },
                                    label: Text(
                                      AppLocalizations.of(context)!
                                          .communityScreen_valueAddGroupButton,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.primaryColor,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .communityScreen_valueGroupsDecsription,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.greyColor,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: groups.length,
                              itemBuilder: (context, index) {
                                return GroupItem(group: groups[index]);
                              },
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              label: Text(
                                AppLocalizations.of(context)!.viewAll,
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                              ),
                              iconAlignment: IconAlignment.end,
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: AppColors.greyColor.withValues(alpha: .3),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      _buildPostSomething(context),

                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          AppLocalizations.of(context)!
                              .communityScreen_valueHeadingsCategories,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      // Categories
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            spacing: 8,
                            children: List.generate(
                              artisanServices.keys.length + 1,
                              (index) {
                                List<String> categories =
                                    artisanServices.keys.toList();
                                categories.add('All');
                                String category =
                                    categories.reversed.toList()[index];
                                bool isAll = category.toLowerCase() == 'all';
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isAll
                                        ? AppColors.primaryColor
                                        : AppColors.greyColor
                                            .withValues(alpha: .2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    isAll
                                        ? AppLocalizations.of(context)!
                                            .communityScreen_valueCategoryAll
                                        : getLocalizedCategory(category),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontWeight:
                                                isAll ? FontWeight.bold : null,
                                            color: isAll
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      // Sort by
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .communityScreen_valueSortByLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: AppColors.greyColor,
                                  ),
                            ),
                            Spacer(),
                            ...List.generate(
                              2,
                              (index) {
                                List<String> sortByList = [
                                  AppLocalizations.of(context)!
                                      .communityScreen_valueSortByNewer,
                                  AppLocalizations.of(context)!
                                      .communityScreen_valueSortByMostEngaged,
                                ];
                                String sortByItem = sortByList[index];
                                bool isSortByNewer = sortByItem ==
                                    AppLocalizations.of(context)!
                                        .communityScreen_valueSortByNewer;
                                return Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: isSortByNewer
                                        ? AppColors.primaryColor
                                            .withValues(alpha: .6)
                                        : AppColors.greyColor
                                            .withValues(alpha: .2),
                                  ),
                                  child: Text(
                                    sortByItem,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: additionalPosts.length,
                        itemBuilder: (context, index) {
                          return PostItem(post: additionalPosts[index]);
                        },
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostSomething(BuildContext context) {
    final TextEditingController postController = TextEditingController();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile picture and text field row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatars/client_avatar.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        size: 24,
                        color: AppColors.primaryColor,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Text field
              Expanded(
                child: TextField(
                  controller: postController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .communityScreen_valuePostHint,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.whiteColor.withValues(alpha: .1),
                        width: .2,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                context: context,
                icon: Icons.photo,
                label: AppLocalizations.of(context)!
                    .communityScreen_valuePhotoButton,
                onTap: () {
                  // Handle photo selection
                },
              ),
              _buildActionButton(
                context: context,
                icon: Icons.videocam,
                label: AppLocalizations.of(context)!
                    .communityScreen_valueVideoButton,
                onTap: () {
                  // Handle video selection
                },
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: Text(
                    AppLocalizations.of(context)!
                        .communityScreen_valuePostButton,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
