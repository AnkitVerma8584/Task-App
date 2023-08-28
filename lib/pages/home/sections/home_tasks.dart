import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/models/task_list.dart';
import 'package:task_app/pages/home/widgets/task_card.dart';
import 'package:task_app/pages/task_details/task_details_screen.dart';

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
            child: Consumer<TaskList>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: value.taskList.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TaskDetailsScreen(
                                  task: value.taskList[index]))),
                      child: HomeTaskCard(task: value.taskList[index]))),
            ),
          ),
        ],
      ),
    );
  }
}
