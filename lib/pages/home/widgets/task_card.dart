import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/common/utils.dart';
import 'package:task_app/models/task.dart';

import '../../../common/components/sized_boxes.dart';

class HomeTaskCard extends StatelessWidget {
  const HomeTaskCard({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ),
                Text("${task.completionPercentage} %")
              ],
            ),
            sh8,
            Text(
              task.taskName,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.3,
            ),
            sh8,
            Row(
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                sw8,
                Text(
                  "${formatTimeOfDay(task.startTime)} - ${formatTimeOfDay(task.endTime)}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Due date : ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(DateFormat.yMMMd().format(task.endDate)),
                const Spacer(),
                SizedBox(
                  width: 65,
                  height: 35,
                  child: Stack(
                    children: List.generate(
                        min(2, task.collaborators.length),
                        (index) => Positioned(
                              left: index * 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  task.collaborators[index],
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
