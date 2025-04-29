import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:intl/intl.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.messages,
    required this.index,
  });

  final List<Map<String, dynamic>> messages;
  final int index; // Placeholder for index, should be passed in constructor

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: messages[index]['isFromMe']
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Container(
            key: ValueKey(messages[index]['id'] ?? index),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: messages[index]['isFromMe']
                  ? AppColors.primaryColor.withOpacity(0.7)
                  : AppColors.shadowColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft:
                    Radius.circular(messages[index]['isFromMe'] ? 10 : 0),
                bottomRight:
                    Radius.circular(messages[index]['isFromMe'] ? 0 : 10),
              ),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: messages[index]['isFromMe']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    messages[index]['messageContent'],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: messages[index]['isFromMe']
                              ? AppColors.whiteColor
                              : AppColors.blackColor,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat('HH:mm').format(messages[index]['sentAt']),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.greyColor.withOpacity(0.5),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
