import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';

class TaskAttachmentList extends StatelessWidget {
  const TaskAttachmentList({super.key});

  final List<String> attachments = const [
    "assets/users/p1.png",
    "assets/users/p2.png",
    "assets/users/p3.png",
    "assets/users/p4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          padding: const EdgeInsets.all(0),
          radius: const Radius.circular(8),
          dashPattern: const [6, 5],
          color: Colors.grey,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
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
          child: Flex(
            direction: Axis.horizontal,
            children: List.generate(
                attachments.length,
                (index) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          attachments[index],
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )),
          ),
        ),
      )
    ]);
  }
}
