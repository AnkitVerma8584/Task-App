import 'package:flutter/material.dart';
import 'package:task_app/components/sized_boxes.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/pages/home/widgets/task_card.dart';

class HomeOnGoingTasks extends StatelessWidget {
  const HomeOnGoingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "OnGoing",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text("See all"))
            ],
          ),
          sh12,
          Expanded(
            child: ListView.builder(
                itemCount: dummyTaskList.length,
                itemBuilder: (context, index) {
                  var item = dummyTaskList[index];
                  return HomeTaskCard(
                    taskName: item.taskName,
                    time: item.time,
                    dueDate: item.dueDate,
                    completionPercentage: item.completionPercentage,
                    collaborators: item.collaborators,
                    priority: item.priority,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
