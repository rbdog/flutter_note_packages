import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.75, size.height * 1.08);
    path.cubicTo(size.width * 0.75, size.height * 1.08, size.width * 0.75,
        size.height * 1.08, size.width * 0.74, size.height * 1.08);
    path.cubicTo(size.width * 0.74, size.height * 1.08, size.width * 0.74,
        size.height * 1.08, size.width * 0.74, size.height * 1.08);
    path.cubicTo(size.width * 0.74, size.height * 1.08, size.width * 0.74,
        size.height * 1.08, size.width * 0.74, size.height * 1.08);
    path.cubicTo(size.width * 0.74, size.height * 1.08, size.width * 0.74,
        size.height * 1.06, size.width * 0.74, size.height * 1.06);
    path.cubicTo(size.width * 0.74, size.height * 1.06, size.width * 0.74,
        size.height * 1.06, size.width * 0.74, size.height * 1.06);
    path.cubicTo(size.width * 0.74, size.height * 1.06, size.width * 0.74,
        size.height * 1.06, size.width * 0.74, size.height * 1.06);
    path.cubicTo(size.width * 0.74, size.height * 1.06, size.width * 0.74,
        size.height * 1.05, size.width * 0.75, size.height * 1.05);
    path.cubicTo(size.width * 0.75, size.height * 1.05, size.width * 0.75,
        size.height * 1.05, size.width * 0.75, size.height * 1.05);
    path.cubicTo(size.width * 0.75, size.height * 1.05, size.width * 0.75,
        size.height * 1.05, size.width * 0.75, size.height * 1.05);
    path.cubicTo(size.width * 0.75, size.height * 1.05, size.width * 0.78,
        size.height * 1.05, size.width * 0.78, size.height * 1.05);
    path.cubicTo(size.width * 0.78, size.height * 1.05, size.width * 0.78,
        size.height * 1.05, size.width * 0.78, size.height * 1.05);
    path.cubicTo(size.width * 0.79, size.height * 1.05, size.width * 0.79,
        size.height * 1.05, size.width * 0.79, size.height * 1.05);
    path.cubicTo(size.width * 0.79, size.height * 1.06, size.width * 0.8,
        size.height * 1.06, size.width * 0.8, size.height * 1.06);
    path.cubicTo(size.width * 0.8, size.height * 1.06, size.width * 0.8,
        size.height * 1.06, size.width * 0.8, size.height * 1.06);
    path.cubicTo(size.width * 0.8, size.height * 1.06, size.width * 0.8,
        size.height * 1.06, size.width * 0.8, size.height * 1.06);
    path.cubicTo(size.width * 0.8, size.height * 1.06, size.width * 0.8,
        size.height * 1.08, size.width * 0.8, size.height * 1.08);
    path.cubicTo(size.width * 0.8, size.height * 1.08, size.width * 0.8,
        size.height * 1.08, size.width * 0.8, size.height * 1.08);
    path.cubicTo(size.width * 0.8, size.height * 1.08, size.width * 0.8,
        size.height * 1.08, size.width * 0.8, size.height * 1.08);
    path.cubicTo(size.width * 0.79, size.height * 1.08, size.width * 0.79,
        size.height * 1.08, size.width * 0.79, size.height * 1.08);
    path.cubicTo(size.width * 0.79, size.height * 1.08, size.width * 0.79,
        size.height * 1.08, size.width * 0.79, size.height * 1.08);
    path.cubicTo(size.width * 0.78, size.height * 1.08, size.width * 0.78,
        size.height * 1.08, size.width * 0.78, size.height * 1.08);
    path.cubicTo(size.width * 0.78, size.height * 1.08, size.width * 0.75,
        size.height * 1.08, size.width * 0.75, size.height * 1.08);
    path.cubicTo(size.width * 0.75, size.height * 1.08, size.width * 0.75,
        size.height * 1.08, size.width * 0.75, size.height * 1.08);
    canvas.drawPath(path, paint);

    // Path number 2

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.39, size.width * 0.27,
        size.height * 0.39, size.width * 0.27, size.height * 0.39);
    path.cubicTo(size.width * 0.26, size.height * 0.37, size.width * 0.27,
        size.height * 0.35, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    canvas.drawPath(path, paint);

    // Path number 3

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.27, size.width * 0.27, size.height * 0.27);
    path.cubicTo(size.width * 0.27, size.height * 0.27, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    canvas.drawPath(path, paint);

    // Path number 4

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.46, size.width * 0.27,
        size.height * 0.46, size.width * 0.27, size.height * 0.46);
    path.cubicTo(size.width * 0.27, size.height * 0.46, size.width * 0.27,
        size.height * 0.46, size.width * 0.27, size.height * 0.47);
    path.cubicTo(size.width * 0.26, size.height * 0.48, size.width * 0.27,
        size.height / 2, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    canvas.drawPath(path, paint);

    // Path number 5

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.69, size.height / 4);
    path.cubicTo(size.width * 0.69, size.height / 4, size.width * 0.85,
        size.height / 4, size.width * 0.85, size.height / 4);
    path.cubicTo(size.width * 0.85, size.height / 4, size.width * 0.85,
        size.height / 4, size.width * 0.85, size.height / 4);
    path.cubicTo(size.width * 0.85, size.height / 4, size.width * 0.85,
        size.height / 4, size.width * 0.85, size.height / 4);
    path.cubicTo(size.width * 0.85, size.height / 4, size.width * 0.85,
        size.height / 4, size.width * 0.85, size.height * 0.26);
    path.cubicTo(size.width * 0.86, size.height * 0.26, size.width * 0.86,
        size.height * 0.27, size.width * 0.85, size.height * 0.27);
    path.cubicTo(size.width * 0.85, size.height * 0.27, size.width * 0.85,
        size.height * 0.27, size.width * 0.85, size.height * 0.27);
    path.cubicTo(size.width * 0.85, size.height * 0.27, size.width * 0.85,
        size.height * 0.27, size.width * 0.85, size.height * 0.27);
    path.cubicTo(size.width * 0.85, size.height * 0.27, size.width * 0.85,
        size.height * 0.27, size.width * 0.85, size.height * 0.27);
    path.cubicTo(size.width * 0.84, size.height * 0.27, size.width * 0.69,
        size.height * 0.27, size.width * 0.69, size.height * 0.27);
    path.cubicTo(size.width * 0.69, size.height * 0.27, size.width * 0.69,
        size.height * 0.27, size.width * 0.68, size.height * 0.27);
    path.cubicTo(size.width * 0.68, size.height * 0.27, size.width * 0.68,
        size.height * 0.26, size.width * 0.68, size.height * 0.26);
    path.cubicTo(size.width * 0.68, size.height * 0.26, size.width * 0.68,
        size.height / 4, size.width * 0.69, size.height / 4);
    path.cubicTo(size.width * 0.69, size.height / 4, size.width * 0.69,
        size.height / 4, size.width * 0.69, size.height / 4);
    canvas.drawPath(path, paint);

    // Path number 6

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.86, size.height * 1.07);
    path.cubicTo(size.width * 0.86, size.height * 1.05, size.width * 0.84,
        size.height * 1.04, size.width * 0.82, size.height * 1.03);
    path.cubicTo(size.width * 0.77, size.height, size.width * 0.71,
        size.height * 1.02, size.width * 0.69, size.height * 1.05);
    path.cubicTo(size.width * 0.68, size.height * 1.06, size.width * 0.68,
        size.height * 1.08, size.width * 0.69, size.height * 1.09);
    path.cubicTo(size.width * 0.71, size.height * 1.12, size.width * 0.77,
        size.height * 1.13, size.width * 0.82, size.height * 1.11);
    path.cubicTo(size.width * 0.84, size.height * 1.1, size.width * 0.86,
        size.height * 1.09, size.width * 0.86, size.height * 1.07);
    path.cubicTo(size.width * 0.86, size.height * 1.07, size.width * 0.86,
        size.height * 1.07, size.width * 0.86, size.height * 1.07);
    canvas.drawPath(path, paint);

    // Path number 7

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.35, size.height / 3);
    path.cubicTo(size.width * 0.35, size.height / 3, size.width * 0.83,
        size.height / 3, size.width * 0.83, size.height / 3);
    path.cubicTo(size.width * 0.83, size.height / 3, size.width * 0.83,
        size.height * 0.66, size.width * 0.83, size.height * 0.66);
    path.cubicTo(size.width * 0.83, size.height * 0.66, size.width * 0.35,
        size.height * 0.66, size.width * 0.35, size.height * 0.66);
    path.cubicTo(size.width * 0.35, size.height * 0.66, size.width * 0.35,
        size.height / 3, size.width * 0.35, size.height / 3);
    canvas.drawPath(path, paint);

    // Path number 8

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width / 3, size.height * 1.07);
    path.cubicTo(size.width / 3, size.height * 1.1, size.width * 0.35,
        size.height * 1.12, size.width * 0.38, size.height * 1.13);
    path.cubicTo(size.width * 0.4, size.height * 1.13, size.width * 0.41,
        size.height * 1.13, size.width * 0.42, size.height * 1.13);
    path.cubicTo(size.width * 0.43, size.height * 1.13, size.width * 0.44,
        size.height * 1.13, size.width * 0.44, size.height * 1.13);
    path.cubicTo(size.width * 0.44, size.height * 1.14, size.width * 1.09,
        size.height * 1.13, size.width * 1.09, size.height * 1.13);
    path.cubicTo(size.width * 1.09, size.height * 1.13, size.width * 1.1,
        size.height * 1.13, size.width * 1.1, size.height * 1.13);
    path.cubicTo(size.width * 1.1, size.height * 1.13, size.width * 1.1,
        size.height * 1.13, size.width * 1.1, size.height * 1.13);
    path.cubicTo(size.width * 1.1, size.height * 1.13, size.width * 1.1,
        size.height * 1.13, size.width * 1.1, size.height * 1.13);
    path.cubicTo(size.width * 1.1, size.height * 1.13, size.width * 1.1,
        size.height * 1.13, size.width * 1.1, size.height * 1.13);
    path.cubicTo(size.width * 1.11, size.height * 1.13, size.width * 1.11,
        size.height * 1.13, size.width * 1.12, size.height * 1.13);
    path.cubicTo(size.width * 1.14, size.height * 1.13, size.width * 1.17,
        size.height * 1.12, size.width * 1.19, size.height * 1.11);
    path.cubicTo(size.width * 1.2, size.height * 1.1, size.width * 1.2,
        size.height * 1.09, size.width * 1.21, size.height * 1.09);
    path.cubicTo(size.width * 1.21, size.height * 1.08, size.width * 1.21,
        size.height * 1.08, size.width * 1.21, size.height * 1.08);
    path.cubicTo(size.width * 1.21, size.height * 1.08, size.width * 1.21,
        size.height * 1.07, size.width * 1.21, size.height * 1.07);
    path.cubicTo(size.width * 1.21, size.height * 1.07, size.width * 1.21,
        size.height * 0.26, size.width * 1.21, size.height * 0.26);
    path.cubicTo(size.width * 1.21, size.height / 4, size.width * 1.2,
        size.height * 0.24, size.width * 1.2, size.height * 0.23);
    path.cubicTo(size.width * 1.18, size.height * 0.22, size.width * 1.15,
        size.height / 5, size.width * 1.12, size.height / 5);
    path.cubicTo(size.width * 1.12, size.height / 5, size.width * 1.11,
        size.height / 5, size.width * 1.1, size.height / 5);
    path.cubicTo(size.width * 1.1, size.height / 5, size.width * 1.1,
        size.height / 5, size.width * 1.1, size.height / 5);
    path.cubicTo(size.width * 1.1, size.height / 5, size.width * 1.1,
        size.height / 5, size.width * 1.1, size.height / 5);
    path.cubicTo(size.width * 1.1, size.height / 5, size.width * 1.09,
        size.height / 5, size.width * 1.09, size.height / 5);
    path.cubicTo(size.width * 1.09, size.height / 5, size.width * 0.44,
        size.height / 5, size.width * 0.44, size.height / 5);
    path.cubicTo(size.width * 0.44, size.height / 5, size.width * 0.44,
        size.height / 5, size.width * 0.44, size.height / 5);
    path.cubicTo(size.width * 0.42, size.height / 5, size.width * 0.41,
        size.height / 5, size.width * 0.4, size.height / 5);
    path.cubicTo(size.width * 0.37, size.height / 5, size.width * 0.35,
        size.height * 0.22, size.width * 0.34, size.height * 0.23);
    path.cubicTo(size.width * 0.34, size.height * 0.24, size.width / 3,
        size.height * 0.24, size.width / 3, size.height / 4);
    path.cubicTo(size.width / 3, size.height / 4, size.width / 3,
        size.height / 4, size.width / 3, size.height * 0.26);
    path.cubicTo(size.width / 3, size.height * 0.26, size.width / 3,
        size.height * 0.26, size.width / 3, size.height * 0.26);
    path.cubicTo(size.width / 3, size.height * 0.26, size.width / 3,
        size.height * 1.07, size.width / 3, size.height * 1.07);
    path.cubicTo(size.width / 3, size.height * 1.07, size.width / 3,
        size.height * 1.07, size.width / 3, size.height * 1.07);
    canvas.drawPath(path, paint);

    // Path number 9

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 1.14,
        size.height * 0.17, size.width * 1.14, size.height * 0.17);
    path.cubicTo(size.width * 1.14, size.height * 0.17, size.width * 1.14,
        size.height * 0.17, size.width * 1.14, size.height * 0.17);
    path.cubicTo(size.width * 1.15, size.height * 0.17, size.width * 1.15,
        size.height * 0.17, size.width * 1.15, size.height * 0.17);
    canvas.drawPath(path, paint);

    // Path number 10

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 0.44, size.height * 0.17);
    path.cubicTo(size.width * 0.44, size.height * 0.17, size.width * 0.44,
        size.height * 0.17, size.width * 0.44, size.height * 0.17);
    path.cubicTo(size.width * 0.39, size.height * 0.17, size.width * 0.34,
        size.height * 0.18, size.width * 0.3, size.height / 5);
    path.cubicTo(size.width * 0.3, size.height / 5, size.width * 0.29,
        size.height * 0.22, size.width * 0.28, size.height * 0.22);
    path.cubicTo(size.width * 0.28, size.height * 0.23, size.width * 0.27,
        size.height * 0.24, size.width * 0.27, size.height / 4);
    path.cubicTo(size.width * 0.27, size.height / 4, size.width * 0.27,
        size.height / 4, size.width * 0.27, size.height / 4);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 1.08, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.08, size.width * 0.27,
        size.height * 1.08, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.08, size.width * 0.27,
        size.height * 1.08, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.08, size.width * 0.27,
        size.height * 1.08, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.09, size.width * 0.27,
        size.height * 1.09, size.width * 0.27, size.height * 1.09);
    path.cubicTo(size.width * 0.28, size.height * 1.1, size.width * 0.28,
        size.height * 1.1, size.width * 0.28, size.height * 1.11);
    path.cubicTo(size.width * 0.3, size.height * 1.13, size.width / 3,
        size.height * 1.15, size.width * 0.36, size.height * 1.16);
    path.cubicTo(size.width * 0.38, size.height * 1.16, size.width * 0.39,
        size.height * 1.16, size.width * 0.4, size.height * 1.16);
    path.cubicTo(size.width * 0.41, size.height * 1.16, size.width * 0.42,
        size.height * 1.16, size.width * 0.42, size.height * 1.16);
    path.cubicTo(size.width * 0.43, size.height * 1.16, size.width * 0.43,
        size.height * 1.16, size.width * 0.43, size.height * 1.17);
    path.cubicTo(size.width * 0.43, size.height * 1.17, size.width * 0.43,
        size.height * 1.17, size.width * 0.43, size.height * 1.17);
    path.cubicTo(size.width * 0.43, size.height * 1.17, size.width * 0.44,
        size.height * 1.17, size.width * 0.44, size.height * 1.17);
    path.cubicTo(size.width * 0.44, size.height * 1.17, size.width * 1.1,
        size.height * 1.17, size.width * 1.1, size.height * 1.17);
    path.cubicTo(size.width * 1.11, size.height * 1.17, size.width * 1.12,
        size.height * 1.16, size.width * 1.13, size.height * 1.16);
    path.cubicTo(size.width * 1.18, size.height * 1.16, size.width * 1.22,
        size.height * 1.14, size.width * 1.25, size.height * 1.12);
    path.cubicTo(size.width * 1.26, size.height * 1.11, size.width * 1.26,
        size.height * 1.1, size.width * 1.26, size.height * 1.09);
    path.cubicTo(size.width * 1.26, size.height * 1.08, size.width * 1.26,
        size.height * 1.08, size.width * 1.26, size.height * 1.08);
    path.cubicTo(size.width * 1.27, size.height * 1.08, size.width * 1.26,
        size.height * 0.26, size.width * 1.26, size.height * 0.26);
    path.cubicTo(size.width * 1.26, size.height / 4, size.width * 1.26,
        size.height / 4, size.width * 1.26, size.height / 4);
    path.cubicTo(size.width * 1.26, size.height * 0.23, size.width * 1.25,
        size.height * 0.22, size.width * 1.24, size.height / 5);
    path.cubicTo(size.width * 1.23, size.height / 5, size.width * 1.2,
        size.height * 0.18, size.width * 1.17, size.height * 0.18);
    path.cubicTo(size.width * 1.16, size.height * 0.17, size.width * 1.15,
        size.height * 0.17, size.width * 1.13, size.height * 0.17);
    path.cubicTo(size.width * 1.13, size.height * 0.17, size.width * 1.12,
        size.height * 0.17, size.width * 1.11, size.height * 0.17);
    path.cubicTo(size.width * 1.11, size.height * 0.17, size.width * 1.11,
        size.height * 0.17, size.width * 1.11, size.height * 0.17);
    path.cubicTo(size.width * 1.1, size.height * 0.17, size.width * 1.1,
        size.height * 0.17, size.width * 1.1, size.height * 0.17);
    path.cubicTo(size.width * 1.1, size.height * 0.17, size.width / 2,
        size.height * 0.17, size.width / 2, size.height * 0.17);
    path.cubicTo(size.width / 2, size.height * 0.17, size.width / 2,
        size.height * 0.17, size.width * 0.49, size.height * 0.17);
    path.cubicTo(size.width * 0.48, size.height * 0.17, size.width * 0.46,
        size.height * 0.17, size.width * 0.44, size.height * 0.17);
    path.cubicTo(size.width * 0.44, size.height * 0.17, size.width * 0.44,
        size.height * 0.17, size.width * 0.44, size.height * 0.17);
    canvas.drawPath(path, paint);

    // Path number 11

    paint.color = Colors.amber;
    path = Path();
    path.lineTo(size.width * 1.15, size.height * 0.17);
    path.cubicTo(size.width * 1.18, size.height * 0.18, size.width * 1.22,
        size.height * 0.19, size.width * 1.24, size.height / 5);
    path.cubicTo(size.width * 1.25, size.height / 5, size.width * 1.25,
        size.height * 0.22, size.width * 1.25, size.height * 0.23);
    path.cubicTo(size.width * 1.26, size.height * 0.23, size.width * 1.26,
        size.height * 0.24, size.width * 1.26, size.height * 0.24);
    path.cubicTo(size.width * 1.26, size.height / 4, size.width * 1.26,
        size.height / 4, size.width * 1.26, size.height / 4);
    path.cubicTo(size.width * 1.27, size.height / 4, size.width * 1.26,
        size.height * 1.08, size.width * 1.26, size.height * 1.08);
    path.cubicTo(size.width * 1.26, size.height * 1.08, size.width * 1.26,
        size.height * 1.08, size.width * 1.26, size.height * 1.08);
    path.cubicTo(size.width * 1.26, size.height * 1.08, size.width * 1.26,
        size.height * 1.08, size.width * 1.26, size.height * 1.08);
    path.cubicTo(size.width * 1.26, size.height * 1.08, size.width * 1.26,
        size.height * 1.08, size.width * 1.26, size.height * 1.08);
    path.cubicTo(size.width * 1.26, size.height * 1.09, size.width * 1.26,
        size.height * 1.09, size.width * 1.26, size.height * 1.09);
    path.cubicTo(size.width * 1.26, size.height * 1.11, size.width * 1.25,
        size.height * 1.12, size.width * 1.23, size.height * 1.13);
    path.cubicTo(size.width * 1.21, size.height * 1.15, size.width * 1.18,
        size.height * 1.16, size.width * 1.15, size.height * 1.16);
    path.cubicTo(size.width * 1.15, size.height * 1.16, size.width * 1.14,
        size.height * 1.16, size.width * 1.13, size.height * 1.16);
    path.cubicTo(size.width * 1.13, size.height * 1.16, size.width * 1.12,
        size.height * 1.16, size.width * 1.12, size.height * 1.16);
    path.cubicTo(size.width * 1.11, size.height * 1.16, size.width * 1.11,
        size.height * 1.16, size.width * 1.11, size.height * 1.17);
    path.cubicTo(size.width * 1.1, size.height * 1.17, size.width * 1.1,
        size.height * 1.17, size.width * 1.1, size.height * 1.17);
    path.cubicTo(size.width * 1.1, size.height * 1.17, size.width * 0.44,
        size.height * 1.17, size.width * 0.44, size.height * 1.17);
    path.cubicTo(size.width * 0.42, size.height * 1.17, size.width * 0.41,
        size.height * 1.16, size.width * 0.4, size.height * 1.16);
    path.cubicTo(size.width * 0.38, size.height * 1.16, size.width * 0.36,
        size.height * 1.16, size.width * 0.34, size.height * 1.15);
    path.cubicTo(size.width * 0.31, size.height * 1.14, size.width * 0.29,
        size.height * 1.12, size.width * 0.28, size.height * 1.11);
    path.cubicTo(size.width * 0.28, size.height * 1.1, size.width * 0.28,
        size.height * 1.1, size.width * 0.27, size.height * 1.09);
    path.cubicTo(size.width * 0.27, size.height * 1.09, size.width * 0.27,
        size.height * 1.09, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.08, size.width * 0.27,
        size.height * 1.08, size.width * 0.27, size.height * 1.08);
    path.cubicTo(size.width * 0.27, size.height * 1.08, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height * 0.52, size.width * 0.27,
        size.height * 0.52, size.width * 0.27, size.height * 0.52);
    path.cubicTo(size.width * 0.27, size.height / 2, size.width * 0.26,
        size.height * 0.48, size.width * 0.27, size.height * 0.47);
    path.cubicTo(size.width * 0.27, size.height * 0.46, size.width * 0.27,
        size.height * 0.46, size.width * 0.27, size.height * 0.46);
    path.cubicTo(size.width * 0.27, size.height * 0.46, size.width * 0.27,
        size.height * 0.46, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.45, size.width * 0.27, size.height * 0.45);
    path.cubicTo(size.width * 0.27, size.height * 0.45, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.4, size.width * 0.27,
        size.height * 0.4, size.width * 0.27, size.height * 0.4);
    path.cubicTo(size.width * 0.27, size.height * 0.39, size.width * 0.27,
        size.height * 0.39, size.width * 0.27, size.height * 0.39);
    path.cubicTo(size.width * 0.26, size.height * 0.37, size.width * 0.27,
        size.height * 0.35, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.34, size.width * 0.27, size.height * 0.34);
    path.cubicTo(size.width * 0.27, size.height * 0.34, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.3, size.width * 0.27, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height * 0.3, size.width * 0.27,
        size.height * 0.27, size.width * 0.27, size.height * 0.27);
    path.cubicTo(size.width * 0.27, size.height * 0.27, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height * 0.26, size.width * 0.27, size.height * 0.26);
    path.cubicTo(size.width * 0.27, size.height * 0.26, size.width * 0.27,
        size.height / 4, size.width * 0.27, size.height / 4);
    path.cubicTo(size.width * 0.27, size.height * 0.24, size.width * 0.28,
        size.height * 0.24, size.width * 0.28, size.height * 0.23);
    path.cubicTo(size.width * 0.29, size.height / 5, size.width / 3,
        size.height * 0.19, size.width * 0.37, size.height * 0.18);
    path.cubicTo(size.width * 0.38, size.height * 0.17, size.width * 0.4,
        size.height * 0.17, size.width * 0.42, size.height * 0.17);
    path.cubicTo(size.width * 0.43, size.height * 0.17, size.width * 0.43,
        size.height * 0.17, size.width * 0.44, size.height * 0.17);
    path.cubicTo(size.width * 0.44, size.height * 0.17, size.width * 0.44,
        size.height * 0.17, size.width * 0.44, size.height * 0.17);
    path.cubicTo(size.width * 0.44, size.height * 0.17, size.width * 0.44,
        size.height * 0.17, size.width * 0.45, size.height * 0.17);
    path.cubicTo(size.width * 0.45, size.height * 0.17, size.width * 0.46,
        size.height * 0.17, size.width * 0.46, size.height * 0.17);
    path.cubicTo(size.width * 0.47, size.height * 0.17, size.width * 0.48,
        size.height * 0.17, size.width * 0.49, size.height * 0.17);
    path.cubicTo(size.width / 2, size.height * 0.17, size.width / 2,
        size.height * 0.17, size.width / 2, size.height * 0.17);
    path.cubicTo(size.width / 2, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 0.97,
        size.height * 0.17, size.width * 0.97, size.height * 0.17);
    path.cubicTo(size.width * 0.97, size.height * 0.17, size.width * 1.14,
        size.height * 0.17, size.width * 1.14, size.height * 0.17);
    path.cubicTo(size.width * 1.14, size.height * 0.17, size.width * 1.14,
        size.height * 0.17, size.width * 1.14, size.height * 0.17);
    path.cubicTo(size.width * 1.15, size.height * 0.17, size.width * 1.15,
        size.height * 0.17, size.width * 1.15, size.height * 0.17);
    path.cubicTo(size.width * 1.15, size.height * 0.17, size.width * 1.15,
        size.height * 0.17, size.width * 1.15, size.height * 0.17);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
