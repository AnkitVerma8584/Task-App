import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(
            foregroundPainter: LinesPainter(),
          ),
        ),
      ),
    ));
  }
}

class LinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple.shade200
      ..strokeWidth = 2;

    for (double i = 0; i < size.width; i += 10) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(size.width, size.height - i),
        paint,
      );
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width - i, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
