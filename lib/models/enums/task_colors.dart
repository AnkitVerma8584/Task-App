import 'package:flutter/material.dart';

enum TaskColor {
  lightRed(colorName: "Light Red", colorCode: Colors.red),
  lightPurple(colorName: "Light Purple", colorCode: Colors.purple),
  lightBlue(colorName: "Light Blue", colorCode: Colors.blue),
  lightGreen(colorName: "Light Green", colorCode: Colors.green),
  lightYellow(colorName: "Light Yellow", colorCode: Colors.yellow),
  lightIndigo(colorName: "Light Indigo", colorCode: Colors.indigo);

  final String colorName;
  final MaterialColor colorCode;

  const TaskColor({required this.colorName, required this.colorCode});
}
