import 'package:flutter/material.dart';
import 'package:task_app/models/priority.dart';

import '../../../components/sized_boxes.dart';

class HomeTaskCard extends StatelessWidget {
  const HomeTaskCard(
      {super.key,
      required this.taskName,
      required this.time,
      required this.dueDate,
      required this.completionPercentage,
      required this.collaborators,
      required this.priority});

  final String taskName, time, dueDate;
  final int completionPercentage;
  final List<String> collaborators;
  final Priority priority;

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
                      color: priority.color,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    priority.priorityText,
                    textScaleFactor: 0.9,
                  ),
                ),
                Text("$completionPercentage %")
              ],
            ),
            sh8,
            Text(
              taskName,
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
                  time,
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
                Text(dueDate),
                const Spacer(),
                SizedBox(
                  width: 65,
                  height: 35,
                  child: Stack(children: [
                    ...List.generate(
                        2,
                        (index) => Positioned(
                              left: index * 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  collaborators[index],
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:task_app/models/priority.dart';

import '../../../components/sized_boxes.dart';

class HomeTaskCard extends StatelessWidget {
  const HomeTaskCard(
      {super.key,
      required this.taskName,
      required this.time,
      required this.dueDate,
      required this.completionPercentage,
      required this.collaborators,
      required this.priority});

  final String taskName, time, dueDate;
  final int completionPercentage;
  final List<String> collaborators;
  final Priority priority;

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
                      color: priority.color,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    priority.priorityText,
                    textScaleFactor: 0.9,
                  ),
                ),
                Text("$completionPercentage %")
              ],
            ),
            sh8,
            Text(
              taskName,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: 1.3,
            ),
            sh8,
            Text(time),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Due date : $dueDate"),
                SizedBox(
                  width: 65,
                  height: 35,
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          collaborators[0],
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          collaborators[1],
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */