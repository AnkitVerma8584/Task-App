import 'package:flutter/material.dart';
import 'package:task_app/theme/colors.dart';

class SubmitTaskButton extends StatelessWidget {
  const SubmitTaskButton({
    super.key,
    required this.onSubmitPress,
  });
  final VoidCallback onSubmitPress;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: getColorsScheme(context).primaryContainer),
        child: TextButton(
          onPressed: onSubmitPress,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Create Task",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
