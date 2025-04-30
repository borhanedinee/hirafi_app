import 'package:hirafi/models/user_model.dart';

class PostModel {
  final String id;
  final UserModel user;
  final String content;
  final String? imageUrl; // Optional image URL
  final String category;
  final DateTime timestamp;
  final int likes;
  final int comments;
  final int shares;

  PostModel({
    required this.id,
    required this.user,
    required this.content,
    this.imageUrl,
    required this.category,
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}
