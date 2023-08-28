import 'package:flutter/material.dart';

enum TaskColor {
  lightRed(colorName: "Light Red", colorCode: Color.fromRGBO(255, 205, 210, 1)),
  lightPurple(
      colorName: "Light Purple", colorCode: Color.fromRGBO(225, 190, 231, 1)),
  lightBlue(
      colorName: "Light Blue", colorCode: Color.fromRGBO(187, 222, 251, 1)),
  lightGreen(
      colorName: "Light Green", colorCode: Color.fromRGBO(200, 230, 201, 1)),
  lightYellow(
      colorName: "Light Yellow", colorCode: Color.fromRGBO(255, 249, 196, 1)),
  lightIndigo(
      colorName: "Light Indigo", colorCode: Color.fromRGBO(197, 202, 233, 1));

  final String colorName;
  final Color? colorCode;

  const TaskColor({required this.colorName, required this.colorCode});
}
