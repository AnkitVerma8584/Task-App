import 'package:flutter/material.dart';
import 'package:task_app/models/enums/task_colors.dart';

class TaskColorList extends StatefulWidget {
  const TaskColorList({super.key, required this.onColorSelected});

  final void Function(TaskColor color) onColorSelected;

  @override
  State<TaskColorList> createState() => _TaskColorList();
}

class _TaskColorList extends State<TaskColorList> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.onColorSelected(TaskColor.values[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        TaskColor.values.length,
        (index) => GestureDetector(
          onTap: () => setState(() {
            currentIndex = index;
            widget.onColorSelected(TaskColor.values[currentIndex]);
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: currentIndex == index ? 40 : 36,
              width: currentIndex == index ? 40 : 36,
              decoration: BoxDecoration(
                  color: TaskColor.values[index].colorCode,
                  border: Border.all(
                    color: currentIndex == index ? Colors.white : Colors.grey,
                    width: currentIndex == index ? 5 : 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ),
      ),
    );
  }
}
