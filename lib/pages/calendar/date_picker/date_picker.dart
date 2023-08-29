import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/common/components/sized_boxes.dart';
import 'package:task_app/theme/colors.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker(
      {super.key, required this.selectedMonth, required this.onDateSelected});
  final DateTime selectedMonth;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> timeList = getDateTimeList(selectedMonth);
    return SizedBox(
      height: 90,
      child: timeList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeList.length,
              itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => onDateSelected(timeList[index]),
                  child: DateTimeItemCard(
                      date: timeList[index],
                      isSelected: selectedMonth.day == timeList[index].day)))
          : null,
    );
  }
}

// class DatePicker extends StatefulWidget {
//   const DatePicker(
//       {super.key, required this.selectedMonth, required this.onDateSelected});
//   final DateTime selectedMonth;
//   final void Function(DateTime) onDateSelected;

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   late List<DateTime> timeList;

//   @override
//   void initState() {
//     super.initState();
//     timeList = getDateTimeList(widget.selectedMonth);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 90,
//       child: timeList.isNotEmpty
//           ? ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: timeList.length,
//               itemBuilder: (context, index) => DateTimeItemCard(
//                   date: timeList[index], isSelected: index == 0))
//           : null,
//     );
//   }
// }

class DateTimeItemCard extends StatelessWidget {
  const DateTimeItemCard(
      {super.key, required this.date, required this.isSelected});
  final DateTime date;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(DateFormat("E").format(date).toUpperCase()),
          sh8,
          Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isSelected
                      ? getColorsScheme(context).primary
                      : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                date.day.toString(),
                style: TextStyle(
                    color: isSelected
                        ? getColorsScheme(context).onPrimary
                        : getColorsScheme(context).primary),
              ))
        ],
      ),
    );
  }
}

List<DateTime> getDateTimeList(DateTime selectedMonth) {
  int totalDays = daysInMonth(selectedMonth);
  return List.generate(totalDays,
      (index) => DateTime(selectedMonth.year, selectedMonth.month, index + 1));
}

int daysInMonth(DateTime date) {
  var firstDayThisMonth = DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}
