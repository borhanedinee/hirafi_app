import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart'; // Assuming AppColors is defined

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  // Sample notifications data, grouped by time
  final Map<String, List<Map<String, dynamic>>> groupedNotifications = {
    'Today': [
      {
        'icon': Icons.local_offer,
        'title': 'New Direct Offer',
        'message':
            'You have received a new offer from Ahmed for a custom furniture project.',
        'timestamp': '2 hours ago',
        'color': AppColors.primaryColor,
      },
      {
        'icon': Icons.warning,
        'title': 'Offer Expiring Soon',
        'message':
            'The offer from Sara for a carpentry project expires in 24 hours.',
        'timestamp': '5 hours ago',
        'color': Colors.red,
      },
    ],
    'This Week': [
      {
        'icon': Icons.person,
        'title': 'Profile Update Reminder',
        'message':
            'Please upload your work license to complete your artisan profile.',
        'timestamp': '1 day ago',
        'color': Colors.orange,
      },
      {
        'icon': Icons.star,
        'title': 'New Review',
        'message':
            'You received a 5-star review from Khaled for your recent project.',
        'timestamp': '2 days ago',
        'color': Colors.yellow[700],
      },
    ],
    'Older': [
      {
        'icon': Icons.check_circle,
        'title': 'Offer Accepted',
        'message':
            'Your offer for a painting project has been accepted by Laila.',
        'timestamp': '3 days ago',
        'color': Colors.green,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
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
            ? const Center(
                child: Text(
                  'No notifications yet',
                  style: TextStyle(
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
