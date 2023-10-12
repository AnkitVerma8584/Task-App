import 'package:flutter/material.dart';
import 'package:task_app/common/utils.dart';
import 'package:task_app/models/enums/priority.dart';
import 'package:task_app/models/enums/task_colors.dart';

class Task {
  final int taskId;
  final String taskName, taskDescription;
  final DateTime startDate, endDate;
  final TimeOfDay startTime, endTime;
  final int completionPercentage;
  final List<String> collaborators, attachments;
  final TaskColor taskColor;
  final Priority priority;

  String get time =>
      "${startTime.formatTimeOfDay()} - ${endTime.formatTimeOfDay()}";

  Task({
    required this.taskId,
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
