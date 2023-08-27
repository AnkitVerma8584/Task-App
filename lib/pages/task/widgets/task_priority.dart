import 'package:flutter/material.dart';
import 'package:task_app/models/priority.dart';

class TaskPriorityButtons extends StatefulWidget {
  const TaskPriorityButtons({
    super.key,
    required this.onPrioritySelected,
  });
  final void Function(Priority val) onPrioritySelected;

  @override
  State<TaskPriorityButtons> createState() => _TaskPriorityButtonsState();
}

class _TaskPriorityButtonsState extends State<TaskPriorityButtons> {
  final List<Priority> priorityList = [
    Priority.low(),
    Priority.medium(),
    Priority.high()
  ];
  int selectedIndex = 0;

  BoxDecoration getDecoration(Priority priority, bool isSelected) {
    return isSelected
        ? BoxDecoration(
            color: priority.color, borderRadius: BorderRadius.circular(25))
        : BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(priorityList.length, (index) {
        Priority priority = priorityList[index];
        return GestureDetector(
            onTap: () => setState(() {
                  selectedIndex = index;
                  widget.onPrioritySelected(priorityList[index]);
                }),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.all(8),
              decoration: getDecoration(priority, selectedIndex == index),
              child: Text(priority.priorityText),
            ));
      }),
    );
  }
}
