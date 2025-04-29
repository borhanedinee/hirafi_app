import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hirafi/main.dart';
import 'package:hirafi/presentation/widgets/messages_screen/message_item.dart';
import 'package:hirafi/presentation/widgets/my_text_field.dart';
import 'package:hirafi/utils/app_colors.dart';
import 'package:hirafi/utils/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {Key? key,
      required this.userName,
      required this.timestamp,
      required this.messagePreview,
      required this.category,
      required this.avatar})
      : super(key: key);

  final String userName;
  final String timestamp;
  final String messagePreview;
  final String category;
  final String avatar;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // ScrollController to manage scrolling
  final ScrollController _scrollController = ScrollController();

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Scroll to bottom after the first frame is rendered
    messages.add({
      "messageContent": widget.messagePreview,
      "isFromMe": false,
      "sentAt": DateTime.now().subtract(Duration(minutes: 30)),
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Function to scroll to the bottom
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Example: Add a new message and scroll to bottom
  void _addMessage(String content, bool isFromMe) {
    setState(() {
      messages.add({
        'id': '${messages.length + 1}',
        'messageContent': content,
        'isFromMe': isFromMe,
        'sentAt': DateTime.now(),
      });
    });
    // Scroll to bottom after adding a new message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  final List<Map<String, dynamic>> messages = [
    {
      "messageContent": "Salam, vous êtes disponible aujourd'hui ?",
      "isFromMe": false,
      "sentAt": DateTime.now().subtract(Duration(minutes: 30)),
    },
    {
      "messageContent": "Wa alaykom salam, oui je suis dispo l'après-midi.",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 28)),
    },
    {
      "messageContent": "Vous pouvez passer à 15h ?",
      "isFromMe": false,
      "sentAt": DateTime.now().subtract(Duration(minutes: 27)),
    },
    {
      "messageContent": "Parfait, je note 15h inchallah.",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 25)),
    },
    {
      "messageContent": "Quel est votre adresse exactement ?",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 23)),
    },
    {
      "messageContent": "C’est au centre ville, près de la mosquée El Atik.",
      "isFromMe": false,
      "sentAt": DateTime.now().subtract(Duration(minutes: 22)),
    },
    {
      "messageContent": "D'accord je vois, je serai là à l'heure.",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 20)),
    },
    {
      "messageContent": "Super, à tout à l’heure !",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 18)),
    },
    {
      "messageContent": "Parfait, merci à vous 😊",
      "isFromMe": true,
      "sentAt": DateTime.now().subtract(Duration(minutes: 17)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
          width: size.width,
          height: size.height,
          decoration: AppThemes.scaffoldBackgroundDecoration,
          child: Stack(
            children: [
              // Conversation messages messages from me and fom user
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  controller: _scrollController, // Attach ScrollController
                  itemCount: messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == messages.length) {
                      return const SizedBox(height: 100);
                    }
                    if (index == 0) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          MessageItem(messages: messages, index: index)
                        ],
                      );
                    }
                    return MessageItem(messages: messages, index: index);
                  },
                ),
              ),
              // build send message field
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 10,
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Attach button
                      IconButton(
                        icon: const Icon(
                          Icons.attach_file,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          showAttachmentDialog(context, l10n);
                        },
                      ),
                      Expanded(
                        child: MyTextField(
                          controller: _messageController,
                          hintText: l10n.messagesScreen_typeMessage,
                          fillColor: AppColors.greyColor.withValues(alpha: .05),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.send,
                            color: AppColors.primaryColor),
                        onPressed: () {
                          if (_messageController.text.isNotEmpty) {
                            _addMessage(_messageController.text, true);
                            _messageController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void showAttachmentDialog(BuildContext context, AppLocalizations l10n) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: AppThemes.scaffoldBackgroundDecoration.copyWith(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child:
                    Icon(FontAwesomeIcons.file, color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_document),
              onTap: () {
                Get.back();
                // Handle document selection
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(FontAwesomeIcons.camera,
                    color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_camera),
              onTap: () {
                Get.back();
                // Handle camera
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child:
                    Icon(FontAwesomeIcons.image, color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_gallery),
              onTap: () {
                Get.back();
                // Handle gallery
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child:
                    Icon(FontAwesomeIcons.video, color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_video),
              onTap: () {
                Get.back();
                // Handle video
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(FontAwesomeIcons.microphone,
                    color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_audio),
              onTap: () {
                Get.back();
                // Handle audio
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(FontAwesomeIcons.locationDot,
                    color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_location),
              onTap: () {
                Get.back();
                // Handle location
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.pink,
                child:
                    Icon(FontAwesomeIcons.user, color: Colors.white, size: 20),
              ),
              title: Text(l10n.messagesScreen_attachment_contact),
              onTap: () {
                Get.back();
                // Handle contact
              },
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          // User Avatar
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                widget.avatar,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.whiteColor,
                    ),
              ),
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.category,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.7),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // video call
        IconButton(
          icon: const Icon(
            Icons.videocam,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            // Handle video call
          },
        ),
        // voice call
        IconButton(
          icon: const Icon(
            Icons.call,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            // Handle voice call
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            // Handle more options
          },
        ),
      ],
      backgroundColor: AppColors.primaryColor,
    );
  }
}
