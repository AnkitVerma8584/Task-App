import 'package:flutter/material.dart';

class TaskColorList extends StatefulWidget {
  const TaskColorList({super.key, required this.onColorSelected});

  final void Function(MaterialColor color) onColorSelected;

  @override
  State<TaskColorList> createState() => _TaskColorList();
}

class _TaskColorList extends State<TaskColorList> {
  int currentIndex = 0;
  final List<MaterialColor> taskColors = const [
    Colors.red,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.indigo
  ];
  @override
  void initState() {
    super.initState();
    widget.onColorSelected(taskColors[currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        taskColors.length,
        (index) => GestureDetector(
          onTap: () => setState(() {
            currentIndex = index;
            widget.onColorSelected(taskColors[currentIndex]);
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: currentIndex == index ? 40 : 36,
              width: currentIndex == index ? 40 : 36,
              decoration: BoxDecoration(
                  color: taskColors[index],
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
