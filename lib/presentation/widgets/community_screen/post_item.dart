import 'package:flutter/material.dart';
import 'package:hirafi/models/post_model.dart';
import 'package:hirafi/core/themes/app_colors.dart';
import 'package:intl/intl.dart'; // For formatting timestamp

class PostItem extends StatelessWidget {
  final PostModel post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and timestamp
          Row(
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
                  child: post.user.profileImage != null
                      ? Image.asset(
                          post.user.profileImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 24,
                              color: AppColors.primaryColor,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/profile_placeholder.png',
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
              // User name and timestamp
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.user.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${post.user.gender == 'Male' ? 'Artisan' : 'Client'} • ${_formatTimestamp(post.timestamp)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              // More options icon
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // Handle more options (e.g., edit, delete post)
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Post content
          Text(
            post.content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                ),
          ),
          if (post.imageUrl != null) ...[
            const SizedBox(height: 10),
            // Post image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  post.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'Image not available',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),
          // Category
          Row(
            children: [
              Icon(
                _getCategoryIcon(post.category),
                size: 16,
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 5),
              Text(
                post.category,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Interaction buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInteractionButton(
                icon: Icons.favorite_border,
                count: post.likes,
                onTap: () {
                  // Handle like
                },
              ),
              _buildInteractionButton(
                icon: Icons.comment,
                count: post.comments,
                onTap: () {
                  // Handle comment
                },
              ),
              _buildInteractionButton(
                icon: Icons.share,
                count: post.shares,
                onTap: () {
                  // Handle share
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper to format timestamp (e.g., "2h ago")
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // Helper to get icon for category
  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Carpentry':
        return Icons.build;
      case 'Plumbing':
        return Icons.plumbing;
      default:
        return Icons.category;
    }
  }

  // Helper to build interaction buttons (like, comment, share)
  Widget _buildInteractionButton({
    required IconData icon,
    required int count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(
            '$count',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
