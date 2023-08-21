import 'package:flutter/material.dart';

import '../widgets/home_widget_tile.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({
    super.key,
  });

  final TextStyle textStyleTitle = const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
  final TextStyle textStyleBody =
      const TextStyle(fontSize: 16, color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 15),
                          color: Colors.white30,
                          blurRadius: 50.0,
                          spreadRadius: 1),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/phone.png",
                        width: 100, height: 100),
                    const Spacer(),
                    Text("Mobile", style: textStyleTitle),
                    Text("6 tasks", style: textStyleBody),
                  ],
                ),
              )),
          const SizedBox(width: 16),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  HomeWidgetTile(
                    colors: Colors.blue[100],
                    textStyleTitle: textStyleTitle,
                    textStyleBody: textStyleBody,
                    image: 'assets/images/bulb.png',
                    title: 'Wireframes',
                    body: '12 tasks',
                  ),
                  const SizedBox(height: 16),
                  HomeWidgetTile(
                    colors: Colors.yellow[100],
                    textStyleTitle: textStyleTitle,
                    textStyleBody: textStyleBody,
                    image: 'assets/images/puzzle.png',
                    title: 'Websites',
                    body: '5 tasks',
                  )
                ],
              )),
        ],
      ),
    );
  }
}
