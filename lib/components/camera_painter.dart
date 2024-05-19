import 'package:flutter/material.dart';

class CameraPainter extends CustomPainter {
  final Map<String, dynamic> boxCoordinates;

  CameraPainter(this.boxCoordinates);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Rect rect;

    if (boxCoordinates['x1'] != null &&
        boxCoordinates['y1'] != null &&
        boxCoordinates['x2'] != null &&
        boxCoordinates['y2'] != null) {
      rect = Rect.fromPoints(
        Offset(
          (400 * (boxCoordinates['x1'] / 970)).toDouble(),
          (750 * (boxCoordinates['y1'] / 1870)).toDouble(),
        ),
        Offset(
          (400 * (boxCoordinates['x2'] / 970)).toDouble(),
          (750 * (boxCoordinates['y2'] / 1870)).toDouble(),
        ),
      );

      // Draw the rectangle
      canvas.drawRect(rect, paint);

      // Draw the letter in the top-left corner of the rectangle
      const textStyle = TextStyle(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700);
      final textSpan = TextSpan(
        text: boxCoordinates['letter'] ?? '',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      final textOffset = Offset(
        rect.left,
        rect.top - textPainter.height,
      );
      textPainter.paint(canvas, textOffset);
    } else {
      rect = Rect.zero;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
