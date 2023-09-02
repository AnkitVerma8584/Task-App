import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class TaskAttachmentList extends StatelessWidget {
  const TaskAttachmentList({super.key});

  final List<String> attachments = const [
    "assets/users/p1.png",
    "assets/users/p2.png",
    "assets/users/p3.png",
    "assets/users/p4.png",
    "assets/users/p1.png",
    "assets/users/p2.png",
    "assets/users/p3.png",
    "assets/users/p4.png",
    "assets/users/p1.png",
    "assets/users/p2.png",
    "assets/users/p3.png",
    "assets/users/p4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 8,
          runSpacing: 12,
          direction: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  strokeWidth: 2,
                  padding: const EdgeInsets.all(0),
                  radius: const Radius.circular(8),
                  dashPattern: const [6, 5],
                  color: Colors.grey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.add),
                    ),
                  )),
            ),
            ...List.generate(
                attachments.length,
                (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        attachments[index],
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ))
          ],
        ));
  }
}
