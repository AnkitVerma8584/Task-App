import 'package:flutter/material.dart';
import 'package:task_app/models/priority.dart';

class Task {
  final String taskName, taskDescription;
  final DateTime startDate, endDate;
  final TimeOfDay startTime, endTime;
  final int completionPercentage;
  final List<String> collaborators, attachments;
  final MaterialColor taskColor;
  final Priority priority;

  Task({
    required this.taskName,
    required this.taskDescription,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.completionPercentage,
    required this.collaborators,
    required this.attachments,
    required this.taskColor,
    required this.priority,
  });
}
