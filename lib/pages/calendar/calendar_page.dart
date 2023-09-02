
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_app/pages/calendar/date_picker/date_picker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selected = DateTime.now();
  CalendarController controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    Appointment appointment = Appointment(
        startTime: selected,
        endTime: selected.copyWith(hour: 20),
        color: Colors.blue,
        subject: "Open website",
        notes: "Do this",
        resourceIds: ["", ""]);

    Appointment appointment1 = Appointment(
        startTime: selected,
        endTime: selected.copyWith(day: 30),
        color: Colors.green,
        subject: "Open wrbsite");
    Appointment appointment2 = Appointment(
        startTime: selected,
        endTime: selected.copyWith(hour: 18),
        color: Colors.purple,
        subject: "Do something");
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextButton(
            onPressed: () {
              showMonthYearPicker(
                      context: context,
                      initialDate: selected,
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2030))
                  .then((value) {
                if (value != null) {
                  setState(() {
                    selected = value;
                  });
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('MMMM yyyy').format(selected),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            )),
        MyDatePicker(
            selectedMonth: selected,
            onDateSelected: (dt) {
              setState(() {
                selected = selected.copyWith(day: dt.day);
                controller.selectedDate = selected;
                controller.displayDate = selected;
              });
            }),
        Expanded(
            child: SfCalendar(
          controller: controller,
          dataSource: TaskDataSource([appointment, appointment1, appointment2]),
          appointmentBuilder: myAppointmentBuilder,
          viewNavigationMode: ViewNavigationMode.none,
        ))
      ]),
    ));
  }
}

Widget myAppointmentBuilder(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  return Container(
    height: calendarAppointmentDetails.bounds.height,
    width: calendarAppointmentDetails.bounds.width,
    color: appointment.color.withOpacity(0.2),
    padding: const EdgeInsets.all(5),
    alignment: Alignment.center,
    child: Text(
      appointment.subject,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

class TaskDataSource extends CalendarDataSource {
  TaskDataSource(List<Appointment> source) {
    appointments = source;
  }
}
