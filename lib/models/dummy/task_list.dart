import 'package:flutter/material.dart';
import 'package:task_app/models/enums/priority.dart';
import 'package:task_app/models/enums/task_colors.dart';
import 'package:task_app/models/task.dart';

class TaskList extends ChangeNotifier {
  List<Task> taskList = [
    Task(
      taskName: "Salon App Wireframe",
      taskDescription: "Complete the salon app wireframe",
      startDate: DateTime(2023, 2),
      endDate: DateTime(2023, 5),
      startTime: const TimeOfDay(hour: 12, minute: 0),
      endTime: const TimeOfDay(hour: 15, minute: 0),
      completionPercentage: 65,
      collaborators: [
        "assets/users/p1.png",
        "assets/users/p2.png",
        "assets/users/p3.png",
        "assets/users/p4.png",
        "assets/users/p5.png",
        "assets/users/p6.png",
      ],
      attachments: [
        "assets/users/p3.png",
        "assets/users/p4.png",
        "assets/users/p5.png",
        "assets/users/p6.png",
      ],
      taskColor: TaskColor.lightPurple,
      priority: Priority.high,
    ),
    Task(
      taskName: "Marketing website",
      taskDescription: "Make the marketing website and host it on hereku",
      startDate: DateTime(2023, 4),
      endDate: DateTime(2023, 6),
      startTime: const TimeOfDay(hour: 18, minute: 0),
      endTime: const TimeOfDay(hour: 22, minute: 0),
      completionPercentage: 65,
      collaborators: [
        "assets/users/p3.png",
        "assets/users/p4.png",
      ],
      attachments: [
        "assets/users/p1.png",
        "assets/users/p2.png",
        "assets/users/p5.png",
        "assets/users/p6.png",
      ],
      taskColor: TaskColor.lightYellow,
      priority: Priority.medium,
    )
  ];

  void addTask(Task task) {
    taskList.insert(0, task);
    notifyListeners();
  }
}
