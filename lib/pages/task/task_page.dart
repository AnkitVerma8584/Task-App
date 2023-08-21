import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../components/sized_boxes.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

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
  };
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
    return Stack(children: [
      Positioned.fill(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controllerMap['task_name'],
                    decoration: InputDecoration(
                        label: const Text('Task Name'),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () =>
                                _controllerMap['task_name']?.clear(),
                            icon: const Icon(Icons.clear))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required*';
                      }
                      return null;
                    },
                  ),
                  sh24,
                  TextFormField(
                    controller: _controllerMap['start_date'],
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        label: const Text('Start Date'),
                        border: const OutlineInputBorder(),
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
                      return null;
                    },
                  ),
                  sh24,
                  TextFormField(
                    readOnly: true,
                    controller: _controllerMap['end_date'],
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        label: const Text('End Date'),
                        border: const OutlineInputBorder(),
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
                      return null;
                    },
                  ),
                  sh24,
                  TextFormField(
                    maxLines: 3,
                    controller: _controllerMap['task_description'],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text('Description'),
                      suffixIcon: IconButton(
                          onPressed: () =>
                              _controllerMap['task_description']?.clear(),
                          icon: const Icon(Icons.clear)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required*';
                      }
                      return null;
                    },
                  ),
                ],
              )),
        ),
      )),
      Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Create Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      )
    ]);
  }
}
