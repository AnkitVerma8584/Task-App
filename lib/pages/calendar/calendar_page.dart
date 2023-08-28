import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:task_app/pages/calendar/date_picker/date_picker.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        TextButton(
            onPressed: () async {
              final selected = await showMonthYearPicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2030));
            },
            child: const Text("Year month")),
        DatePicker(selectedMonth: today),
      ]),
    ));
  }
}

List<DateTime> getDateTimeList(DateTime selectedMonth) {
  int totalDays = daysInMonth(selectedMonth);
  return List.generate(totalDays,
      (index) => DateTime(selectedMonth.year, selectedMonth.month, index));
}

int daysInMonth(DateTime date) {
  DateTime firstDayThisMonth = DateTime(date.year, date.month, 1);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}
