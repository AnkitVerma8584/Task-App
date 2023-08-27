import 'package:flutter/material.dart';

enum Priority {
  low(priorityText: "Low", color: Color.fromRGBO(13, 71, 161, 1)),
  medium(priorityText: "Medium", color: Color.fromRGBO(245, 127, 23, 1)),
  high(priorityText: "High", color: Colors.red);

  final String priorityText;
  final Color? color;
  const Priority({required this.priorityText, required this.color});
}
