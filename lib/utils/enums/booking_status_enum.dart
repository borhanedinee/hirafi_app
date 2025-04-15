import 'package:flutter/material.dart';

enum BookingStatus {
  pending,
  accepted,
  completed,
  waitingReply,
  inProgress,
}

extension BookingStatusExtension on BookingStatus {
  String get displayName {
    switch (this) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.accepted:
        return 'Accepted';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.waitingReply:
        return 'Waiting Reply';
      case BookingStatus.inProgress:
        return 'In Progress';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.accepted:
        return Colors.blue;
      case BookingStatus.completed:
        return Colors.green;
      case BookingStatus.waitingReply:
        return Colors.purple;
      case BookingStatus.inProgress:
        return Colors.amber;
    }
  }

  Color get textColor {
    switch (this) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.accepted:
        return Colors.blue;
      case BookingStatus.completed:
        return Colors.green;
      case BookingStatus.waitingReply:
        return Colors.purple;
      case BookingStatus.inProgress:
        return Colors.amber;
    }
  }

  IconData get icon {
    switch (this) {
      case BookingStatus.pending:
        return Icons.hourglass_empty;
      case BookingStatus.accepted:
        return Icons.check_circle_outline;
      case BookingStatus.completed:
        return Icons.check_circle;
      case BookingStatus.waitingReply:
        return Icons.message;
      case BookingStatus.inProgress:
        return Icons.build;
    }
  }
}
