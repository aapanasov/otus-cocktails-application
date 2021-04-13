import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 200,
            height: 100,
            child: CustomPaint(
              painter: const TransformPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class TransformPainter extends CustomPainter {
  const TransformPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.radial(
        Offset(size.width / 2, size.height / 2),
        size.width / 4,
        [Colors.red, Colors.yellow, Colors.blue],
        [0, 0.5, 1],
      );

    // canvas.save();

    // canvas.translate(0, -200);

    final matrix = Matrix4.skewX(2);
    matrix.scale(1, 2);
    matrix.translate(100);
    matrix.rotateY(20);
    canvas.transform(matrix.storage);

    canvas.drawRect(Offset.zero & size, paint);

    // canvas.restore();

    // canvas.drawRect(
    //   Offset.zero & size,
    //   Paint()
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 4
    //     ..color = Colors.black,
    // );
  }

  @override
  bool shouldRepaint(covariant TransformPainter oldDelegate) {
    return false;
  }
}