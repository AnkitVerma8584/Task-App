import 'package:flutter/material.dart';

class HomeWidgetTile extends StatelessWidget {
  const HomeWidgetTile({
    super.key,
    required this.textStyleTitle,
    required this.textStyleBody,
    required this.image,
    required this.title,
    required this.body,
    required this.colors,
  });

  final TextStyle textStyleTitle;
  final TextStyle textStyleBody;
  final Color? colors;
  final String image, title, body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), color: Colors.white24, blurRadius: 30.0),
          ]),
      child: Row(
        children: [
          Image.asset(image, width: 60, height: 60),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textStyleTitle),
              Text(body, style: textStyleBody),
            ],
          ),
        ],
      ),
    );
  }
}
