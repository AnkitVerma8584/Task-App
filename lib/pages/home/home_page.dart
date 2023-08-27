import 'package:flutter/material.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/pages/home/sections/home_header.dart';
import 'package:task_app/pages/home/sections/home_tasks.dart';
import 'package:task_app/pages/home/sections/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          sh24,
          HomeWidgets(),
          sh24,
          HomeOnGoingTasks(),
        ],
      ),
    );
  }
}
