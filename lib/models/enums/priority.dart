import 'package:flutter/material.dart';

enum Priority {
  low(priorityText: "Low", color: Color.fromRGBO(11, 64, 143, 1)),
  medium(priorityText: "Medium", color: Color.fromRGBO(247, 125, 18, 1)),
  high(priorityText: "High", color: Color.fromARGB(255, 243, 56, 42));

  final String priorityText;
  final Color? color;
  const Priority({required this.priorityText, required this.color});
}
