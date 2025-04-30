import 'package:flutter/material.dart';

class GroupModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final IconData icon;
  final Color color; // Category-specific color for the icon background
  final int members;
  final String recentActivity; // Additional info: e.g., "5 new posts this week"

  GroupModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
    required this.members,
    required this.recentActivity,
  });
}
