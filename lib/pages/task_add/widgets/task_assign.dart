import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/theme/colors.dart';

class TaskAssignList extends StatelessWidget {
  const TaskAssignList({super.key});

  final List<String> collaborators = const [
    "assets/users/p1.png",
    "assets/users/p2.png",
    "assets/users/p3.png",
    "assets/users/p4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      DottedBorder(
          borderType: BorderType.Circle,
          strokeWidth: 2,
          padding: const EdgeInsets.all(0),
          dashPattern: const [6, 5],
          color: Colors.grey,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ),
          )),
      sw8,
      Expanded(
        child: SizedBox(
          height: 50,
          child: Stack(
            children: List.generate(
                collaborators.length,
                (index) => Positioned(
                      left: index * 30,
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        strokeWidth: 5,
                        padding: const EdgeInsets.all(0),
                        dashPattern: const [10, 0],
                        color: getColorsScheme(context).background,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            collaborators[index],
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      )
    ]);
  }
}
