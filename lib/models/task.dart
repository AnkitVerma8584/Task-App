import 'package:task_app/models/priority.dart';

class Task {
  final String taskName, time, dueDate;
  final int completionPercentage;
  final List<String> collaborators;
  final Priority priority;

  const Task({
    required this.taskName,
    required this.time,
    required this.dueDate,
    required this.completionPercentage,
    required this.collaborators,
    required this.priority,
  });
}

List<Task> dummyTaskList = [
  Task(
      taskName: "Salon App Wireframe",
      time: "10:00 AM - 06:00 PM",
      dueDate: "August 25",
      completionPercentage: 82,
      collaborators: [
        "assets/users/p1.png",
        "assets/users/p2.png",
      ],
      priority: Priority.high()),
  Task(
      taskName: "Marketing website",
      time: "10:00 AM - 02:00 PM",
      dueDate: "August 30",
      completionPercentage: 30,
      collaborators: [
        "assets/users/p3.png",
        "assets/users/p4.png",
        "assets/users/p5.png"
      ],
      priority: Priority.medium()),
  Task(
      taskName: "Campaign webpage",
      time: "10:00 AM - 02:00 PM",
      dueDate: "July 30",
      completionPercentage: 50,
      collaborators: [
        "assets/users/p1.png",
        "assets/users/p5.png",
        "assets/users/p6.png"
      ],
      priority: Priority.low()),
];
