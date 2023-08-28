import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/utils.dart';
import 'package:task_app/models/enums/priority.dart';
import 'package:task_app/models/enums/task_colors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/task_list.dart';
import 'package:task_app/pages/task_add/widgets/submit_button.dart';
import 'package:task_app/pages/task_add/widgets/task_assign.dart';
import 'package:task_app/pages/task_add/widgets/task_attachment.dart';
import 'package:task_app/pages/task_add/widgets/task_color.dart';
import 'package:task_app/pages/task_add/widgets/task_priority.dart';
import 'package:task_app/theme/colors.dart';
import 'package:time_range_picker/time_range_picker.dart';
import '../../common/components/sized_boxes.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.clear)),
        title: const Text(
          "Create New Task",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const TaskFormPage(),
    );
  }
}

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({
    super.key,
  });

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllerMap = {
    'task_name': TextEditingController(text: "My Task 1"),
    'start_date': TextEditingController(),
    'end_date': TextEditingController(),
    'task_description': TextEditingController(),
    'tast_time': TextEditingController()
  };

  late DateTime startDate, endDate;
  late TimeOfDay startTime, endTime;
  Priority priority = Priority.low;
  late TaskColor taskColor;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    endDate = startDate.add(const Duration(days: 1));
  }

  @override
  void dispose() {
    _controllerMap.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime initial, String label) async {
    final DateTime? picked = await showDatePicker(
        helpText: label,
        context: context,
        initialDate: initial,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    return picked;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headerStyle = TextStyle(
        color: getColorsScheme(context).onBackground.withOpacity(0.5),
        fontSize: 12);
    return Stack(children: [
      Positioned.fill(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task Name', style: headerStyle),
                  TextFormField(
                    controller: _controllerMap['task_name'],
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () =>
                                _controllerMap['task_name']?.clear(),
                            icon: const Icon(Icons.clear))),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? 'Required*'
                          : null;
                    },
                  ),
                  sh30,
                  Text('Start Date', style: headerStyle),
                  TextFormField(
                    controller: _controllerMap['start_date'],
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              var value = await _selectDate(
                                  context, startDate, "Choose a start date");
                              if (value != null) {
                                startDate = value;
                                _controllerMap['start_date']?.text =
                                    DateFormat.yMMMd().format(value);
                              }
                            },
                            icon: const Icon(Icons.calendar_month))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required*';
                      }
                      if (startDate.isAfter(endDate)) {
                        return 'Start date should be before end date';
                      }
                      return null;
                    },
                  ),
                  sh30,
                  Text('End Date', style: headerStyle),
                  TextFormField(
                    readOnly: true,
                    controller: _controllerMap['end_date'],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              var value = await _selectDate(
                                  context, endDate, "Choose an end date");
                              if (value != null) {
                                endDate = value;
                                _controllerMap['end_date']?.text =
                                    DateFormat.yMMMd().format(value);
                              }
                            },
                            icon: const Icon(Icons.calendar_month))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required*';
                      }
                      if (endDate.isBefore(startDate)) {
                        return 'End date should be after start date';
                      }
                      return null;
                    },
                  ),
                  sh30,
                  Text('Description', style: headerStyle),
                  TextFormField(
                    maxLines: 3,
                    controller: _controllerMap['task_description'],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () =>
                              _controllerMap['task_description']?.clear(),
                          icon: const Icon(Icons.clear)),
                    ),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? 'Required*'
                          : null;
                    },
                  ),
                  sh30,
                  Text('Assign to', style: headerStyle),
                  sh12,
                  const TaskAssignList(),
                  sh12,
                  const Divider(thickness: 2),
                  sh30,
                  Text('Add attachments', style: headerStyle),
                  sh12,
                  const TaskAttachmentList(),
                  sh12,
                  const Divider(thickness: 2),
                  sh30,
                  Text('Pick task color', style: headerStyle),
                  sh12,
                  TaskColorList(
                    onColorSelected: (val) => taskColor = val,
                  ),
                  sh12,
                  const Divider(thickness: 2),
                  sh30,
                  Text('Select time', style: headerStyle),
                  TextFormField(
                    readOnly: true,
                    controller: _controllerMap['tast_time'],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              TimeRange result = await showTimeRangePicker(
                                  context: context,
                                  use24HourFormat: false,
                                  labels: [
                                    ClockLabel.fromDegree(
                                        deg: -90, text: "12:00 PM"),
                                    ClockLabel.fromDegree(
                                        deg: 90, text: "12:00 AM"),
                                    ClockLabel.fromDegree(
                                        deg: 0, text: "06:00 PM"),
                                    ClockLabel.fromDegree(
                                        deg: 180, text: "06:00 AM"),
                                  ]);
                              startTime = result.startTime;
                              endTime = result.endTime;
                              _controllerMap['tast_time']!.text =
                                  "${startTime.formatTimeOfDay()} - ${endTime.formatTimeOfDay()}";
                            },
                            icon: const Icon(CupertinoIcons.clock))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required*';
                      }
                      return null;
                    },
                  ),
                  sh30,
                  Text('Select task priority', style: headerStyle),
                  sh12,
                  TaskPriorityButtons(
                      onPrioritySelected: (val) => priority = val),
                  sh30,
                  sh30,
                ],
              )),
        ),
      )),
      SubmitTaskButton(onSubmitPress: () {
        if (_formKey.currentState!.validate()) {
          Task task = Task(
            taskName: _controllerMap['task_name']!.text,
            taskDescription: _controllerMap['task_description']!.text,
            startDate: startDate,
            endDate: endDate,
            startTime: startTime,
            endTime: endTime,
            completionPercentage: 0,
            collaborators: ["assets/users/p3.png", "assets/users/p1.png"],
            attachments: [],
            taskColor: taskColor,
            priority: priority,
          );
          Provider.of<TaskList>(context, listen: false).addTask(task);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task added')),
          );
          Future.delayed(const Duration(seconds: 2))
              .then((value) => Navigator.pop(context));
        }
      })
    ]);
  }
}
