import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/common/utils.dart';
import 'package:task_app/models/task.dart';

class TaskHeaderInformation extends StatelessWidget {
  const TaskHeaderInformation({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: task.taskId,
            child: Text(
              task.taskName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          sh24,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Date",
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Text(
                    "End Date",
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Text(
                    "Time",
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Text(
                    "Priority",
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              sw72,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.startDate.toyMMMD(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Text(
                    task.endDate.toyMMMD(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Text(
                    task.time,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  sh16,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                        color: task.priority.color,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      task.priority.priorityText,
                      textScaleFactor: 0.9,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
