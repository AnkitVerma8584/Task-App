import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/pages/task_details/sections/task_header_info.dart';
import 'package:task_app/theme/colors.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final TextStyle headerStyle = TextStyle(
        color: getColorsScheme(context).onBackground.withOpacity(0.5),
        fontSize: 12);

    return Stack(children: [
      Positioned.fill(
          child: Container(
        color: task.taskColor.colorCode.shade100,
        height: double.maxFinite,
        width: double.maxFinite,
        child: CustomPaint(
          foregroundPainter: LinesPainter(color: task.taskColor.colorCode),
        ),
      )),
      Positioned.fill(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    )),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskHeaderInformation(task: task),
                Expanded(
                    child: Stack(children: [
                  Positioned.fill(
                    top: 24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: getColorsScheme(context).surface,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(24))),
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description', style: headerStyle),
                            sh12,
                            Text(task.taskDescription),
                            sh8,
                            const Divider(thickness: 1),
                            sh16,
                            Text('Assigned to', style: headerStyle),
                            sh12,
                            AssignedList(collaborators: task.collaborators),
                            sh8,
                            const Divider(thickness: 1),
                            sh16,
                            Text('Attachments', style: headerStyle),
                            sh12,
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                direction: Axis.horizontal,
                                children: List.generate(
                                    task.attachments.length,
                                    (index) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            task.attachments[index],
                                            fit: BoxFit.cover,
                                            height: 50,
                                            width: 50,
                                          ),
                                        )),
                              ),
                            ),
                            sh8,
                            const Divider(thickness: 1),
                            sh16,
                            Text('Task Color', style: headerStyle),
                            sh12,
                            Row(
                              children: [
                                Text(task.taskColor.colorName),
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: task.taskColor.colorCode,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 3,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ],
                            ),
                            sh8,
                            const Divider(thickness: 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 24,
                      child: Container(
                        decoration: BoxDecoration(
                            color: task.taskColor.colorCode[200],
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  spreadRadius: 0),
                            ],
                            borderRadius: BorderRadius.circular(50)),
                        child: TextButton.icon(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.message, color: Colors.black),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: Text("Comments",
                                  style: TextStyle(color: Colors.black)),
                            )),
                      ))
                ]))
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class AssignedList extends StatefulWidget {
  const AssignedList({
    super.key,
    required this.collaborators,
  });

  final List<String> collaborators;

  @override
  State<AssignedList> createState() => _AssignedListState();
}

class _AssignedListState extends State<AssignedList> {
  bool doAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        doAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: List.generate(
            widget.collaborators.length,
            (index) => AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: doAnimation ? index * 40 : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      color: getColorsScheme(context).background,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Image.asset(
                          widget.collaborators[index],
                          fit: BoxFit.cover,
                          height: 46,
                          width: 46,
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

class LinesPainter extends CustomPainter {
  final MaterialColor color;
  const LinesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.shade200.withOpacity(0.2)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (double i = 0; i < size.width; i += 10) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(size.width, size.width - i),
        paint,
      );
      if (i == 0) {
        continue;
      }
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width - i, size.width),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(LinesPainter oldDelegate) => false;
}
