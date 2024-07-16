import 'dart:math' as math;

import 'package:flutter/material.dart';

// Definimos la interface que comparten todos los documentos.
abstract class AppCustomPainter extends CustomPainter {}

abstract class AppCustomPainterUtils extends CustomPainter {

  TextPainter drawText(String text, TextStyle textStyle) {
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: double.maxFinite);

    return textPainter;
  }

  void drawRotated(
    Canvas canvas,
    Offset center,
    double angle,
    VoidCallback drawFunction,
  ) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    canvas.translate(-center.dx, -center.dy);
    drawFunction();
    canvas.restore();
  }

  void drawArc(Canvas canvas, Offset center, Paint border, double radius) {
    final rect =
        Rect.fromCenter(center: center, width: 2 * radius, height: 2 * radius);
    canvas.drawArc(
        rect, -90 * math.pi / 180, 90 * math.pi / 180.0, false, border);
  }

  TextPainter measureText(Canvas canvas, String text, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: double.maxFinite);
    return textPainter;
  }

  void drawTextArc(Canvas canvas, Offset arcCenter, double radius, double a,
      String text, TextStyle style) {
    final pos = Offset(0, -radius);
    text.split('').forEach((c) {
      final tp = measureText(canvas, c, style);
      final w = tp.width + 5.0;
      final double alpha = math.asin(w / (2 * radius));
      canvas.save();
      canvas.translate(arcCenter.dx, arcCenter.dy);
      a += alpha;
      canvas.rotate(a);

      tp.paint(canvas, pos + Offset(-w / 2.0, 0.0));
      canvas.restore();
    });
  }
}