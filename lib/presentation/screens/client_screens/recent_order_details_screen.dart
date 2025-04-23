import 'package:flutter/material.dart';
import 'package:hirafi/models/artisan_model.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:hirafi/utils/enums/booking_status_enum.dart';

class RecentOrderDetailsScreen extends StatelessWidget {
  final ArtisanModel artisan;
  final String date;
  final BookingStatus status;
  final String orderDescription;
  final String orderPrice;

  const RecentOrderDetailsScreen({
    Key? key,
    required this.artisan,
    required this.date,
    required this.status,
    required this.orderDescription,
    required this.orderPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button actions based on status
    Widget primaryButton;
    Widget secondaryButton;

    switch (status) {
      case BookingStatus.waitingReply:
        primaryButton = _buildButton(
          text: 'Accept Offer',
          icon: Icons.check,
          color: AppColors.primaryColor,
          onPressed: () {
            // TODO: Accept the offer
            print('Offer accepted');
          },
        );
        secondaryButton = _buildButton(
          text: 'Reject Offer',
          icon: Icons.close,
          color: Colors.grey.withValues(alpha: .4),
          onPressed: () {
            // TODO: Reject the offer
            print('Offer rejected');
          },
        );
        break;
      case BookingStatus.pending:
        primaryButton = _buildButton(
          text: 'View Artisan Profile',
          icon: Icons.person,
          color: AppColors.primaryColor,
          onPressed: () {
            // TODO: Navigate to artisan profile
            print('Viewing artisan profile');
          },
        );
        secondaryButton = _buildButton(
          text: 'Cancel Order',
          icon: Icons.cancel,
          color: Colors.grey.withValues(alpha: .7),
          onPressed: () {
            // TODO: Cancel the order
            print('Order cancelled');
          },
        );
        break;
      case BookingStatus.accepted:
        primaryButton = _buildButton(
          text: 'View Artisan Profile',
          icon: Icons.person,
          color: AppColors.primaryColor,
          onPressed: () {
            // TODO: Navigate to artisan profile
            print('Viewing artisan profile');
          },
        );
        secondaryButton = _buildButton(
          text: 'Cancel Order',
          icon: Icons.cancel,
          color: Colors.grey.withValues(alpha: .7),
          onPressed: () {
            // TODO: Cancel the order
            print('Order cancelled');
          },
        );
        break;
      case BookingStatus.inProgress:
        primaryButton = _buildButton(
          text: 'View Artisan Profile',
          icon: Icons.person,
          color: AppColors.primaryColor,
          onPressed: () {
            // TODO: Navigate to artisan profile
            print('Viewing artisan profile');
          },
        );
        secondaryButton = _buildButton(
          text: 'Contact Support',
          icon: Icons.support_agent,
          color: Colors.grey.withValues(alpha: .7),
          onPressed: () {
            // TODO: Contact support
            print('Contacting support');
          },
        );
        break;
      case BookingStatus.completed:
        primaryButton = _buildButton(
          text: 'Rate Artisan',
          icon: Icons.star,
          color: AppColors.primaryColor,
          onPressed: () {
            // TODO: Navigate to rating screen
            print('Rating artisan');
          },
        );
        secondaryButton = _buildButton(
          text: 'Reorder',
          icon: Icons.refresh,
          color: Colors.grey.withValues(alpha: .7),
          onPressed: () {
            // TODO: Reorder the service
            print('Reordering service');
          },
        );
        break;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recent Order Details',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.whiteColor,
                ),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration:
              AppThemes.scaffoldBackgroundDecoration, // Gradient background
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Details Card
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Artisan Info
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    artisan.avatar,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      artisan.fullName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.blackColor,
                                          ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      artisan.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: BoxDecoration(
                                  color: status.backgroundColor
                                      .withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        status.backgroundColor.withOpacity(0.3),
                                    width: 0.5,
                                  ),
                                ),
                                child: Text(
                                  status.displayName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: status.textColor,
                                      ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Order Date
                          _buildDetailRow(
                            context: context,
                            label: 'Order Date',
                            value: date,
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.greyColor,
                                    ),
                            valueStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                ),
                          ),

                          const SizedBox(height: 6),
                          Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 6),

                          // Service Category
                          _buildDetailRow(
                            context: context,
                            label: 'Service Category',
                            value: artisan.category,
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.greyColor,
                                    ),
                            valueStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),

                          const SizedBox(height: 6),
                          Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 6),
                          // Order Description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order description',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.greyColor,
                                    ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                orderDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.blackColor,
                                    ),
                              )
                            ],
                          ),

                          const SizedBox(height: 6),
                          Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 6),
                          // Service Price
                          _buildDetailRow(
                            context: context,
                            label: 'Service Price',
                            value: orderPrice,
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.greyColor,
                                    ),
                            valueStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackColor,
                                ),
                          ),

                          const SizedBox(height: 6),
                          Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 32),

                          // Action Buttons (Call, Chat, Message)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildActionButton(
                                context: context,
                                icon: Icons.phone,
                                label: 'Call',
                                onTap: () {
                                  // TODO: Initiate a call
                                  print('Initiating call');
                                },
                              ),
                              _buildActionButton(
                                context: context,
                                icon: Icons.chat,
                                label: 'Chat',
                                onTap: () {
                                  // TODO: Navigate to chat screen
                                  print('Opening chat');
                                },
                              ),
                              _buildActionButton(
                                context: context,
                                icon: Icons.email,
                                label: 'Message',
                                onTap: () {
                                  // TODO: Send a message
                                  print('Sending message');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Primary and Secondary Buttons
                Column(
                  children: [
                    primaryButton,
                    const SizedBox(height: 8),
                    secondaryButton,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required BuildContext context,
    required String label,
    required String value,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: valueStyle ??
                Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
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
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: color.withOpacity(0.3),
        ),
      ),
    );
  }
}
