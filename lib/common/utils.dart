import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FormatTimeOfDay on TimeOfDay {
  String formatTimeOfDay() {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hour, minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }
}

extension ToyMMMD on DateTime {
  String toyMMMD() => DateFormat.yMMMd().format(this);
}
