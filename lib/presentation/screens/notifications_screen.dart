import 'package:flutter/material.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:hirafi/core/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Sample notifications data, grouped by time
    final Map<String, List<Map<String, dynamic>>> groupedNotifications = {
      l10n.notificationsScreen_group_today: [
        {
          'icon': Icons.local_offer,
          'title': l10n.notificationsScreen_newOffer_title,
          'message': l10n.notificationsScreen_newOffer_message,
          'timestamp': l10n.notificationsScreen_newOffer_timestamp,
          'color': AppColors.primaryColor,
        },
        {
          'icon': Icons.warning,
          'title': l10n.notificationsScreen_offerExpiring_title,
          'message': l10n.notificationsScreen_offerExpiring_message,
          'timestamp': l10n.notificationsScreen_offerExpiring_timestamp,
          'color': Colors.red,
        },
      ],
      l10n.notificationsScreen_group_thisWeek: [
        {
          'icon': Icons.person,
          'title': l10n.notificationsScreen_profileUpdate_title,
          'message': l10n.notificationsScreen_profileUpdate_message,
          'timestamp': l10n.notificationsScreen_profileUpdate_timestamp,
          'color': Colors.orange,
        },
        {
          'icon': Icons.star,
          'title': l10n.notificationsScreen_newReview_title,
          'message': l10n.notificationsScreen_newReview_message,
          'timestamp': l10n.notificationsScreen_newReview_timestamp,
          'color': Colors.yellow[700],
        },
      ],
      l10n.notificationsScreen_group_older: [
        {
          'icon': Icons.check_circle,
          'title': l10n.notificationsScreen_offerAccepted_title,
          'message': l10n.notificationsScreen_offerAccepted_message,
          'timestamp': l10n.notificationsScreen_offerAccepted_timestamp,
          'color': Colors.green,
        },
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.notificationsScreen_title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 2,
      ),
      body: Container(
        decoration: AppThemes.scaffoldBackgroundDecoration,
        child: groupedNotifications.isEmpty
            ? Center(
                child: Text(
                  l10n.notificationsScreen_noNotifications,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.greyColor,
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: groupedNotifications.entries.map((group) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Subtitle for the group
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          group.key,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      // Notifications in the group
                      ...group.value.asMap().entries.map((entry) {
                        int index = entry.key;
                        var notification = entry.value;
                        return Column(
                          children: [
                            _buildNotificationTile(
                              icon: notification['icon'] as IconData,
                              title: notification['title'] as String,
                              message: notification['message'] as String,
                              timestamp: notification['timestamp'] as String,
                              color: notification['color'] as Color,
                            ),
                            // Add divider except for the last item in the group
                            if (index < group.value.length - 1)
                              Divider(
                                height: 4,
                                color:
                                    AppColors.greyColor.withValues(alpha: .3),
                                thickness: 1,
                              ),
                          ],
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String message,
    required String timestamp,
    required Color color,
  }) {
    return Container(
      color: AppColors.greyColor.withValues(alpha: .05),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              timestamp,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.navigate_next,
          size: 18,
        ),
        onTap: () {
          // TODO: Navigate to relevant screen or show more details
          print('Tapped on: $title');
        },
      ),
    );
  }
}
