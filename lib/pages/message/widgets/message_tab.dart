import 'package:flutter/material.dart';
import 'package:task_app/theme/colors.dart';

class MessageTab extends StatelessWidget {
  const MessageTab(
      {super.key, required this.tabName, required this.isSelected});
  final String tabName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  isSelected ? getColorsScheme(context).primary : Colors.grey,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        tabName,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? getColorsScheme(context).primary : Colors.grey),
      ),
    );
  }
}
