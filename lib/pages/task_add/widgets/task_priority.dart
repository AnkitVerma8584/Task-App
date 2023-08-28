import 'package:flutter/material.dart';
import 'package:task_app/models/enums/priority.dart';

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
      children: List.generate(Priority.values.length, (index) {
        Priority priority = Priority.values[index];
        return GestureDetector(
            onTap: () => setState(() {
                  selectedIndex = index;
                  widget.onPrioritySelected(Priority.values[index]);
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
