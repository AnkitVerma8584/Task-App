import 'package:flutter/material.dart';

class Priority {
  final String priorityText;
  final Color? color;

  const Priority({required this.priorityText, required this.color});

  static Priority high() =>
      const Priority(priorityText: "High", color: Colors.red);
  static Priority medium() =>
      Priority(priorityText: "Medium", color: Colors.yellow[900]);
  static Priority low() =>
      Priority(priorityText: "Low", color: Colors.blue[900]);
}
