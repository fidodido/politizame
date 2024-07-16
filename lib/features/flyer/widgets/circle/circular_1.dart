import 'package:flutter/material.dart';
import '../../bloc/flyer_state.dart';
import '../../utils/app_custom_painter.dart';

class Circular1 extends StatelessWidget {
  final FlyerState state;
  const Circular1({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double flyerWidth = constraints.maxWidth;
        double flyerHeight = constraints.maxHeight;
        return Stack(
          children: [
            SizedBox(
              width: flyerWidth,
              height: flyerHeight,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  CustomPaint(painter: Circular1Canvas(state: state)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Circular1Canvas extends AppCustomPainterUtils
    implements AppCustomPainter {
  final FlyerState state;

  Circular1Canvas({required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    canvas.clipPath(path);

    drawCircleContainerOutside(canvas, size);
    drawImage(canvas, size);
    drawCircleContainer(canvas, size);
  }

  void drawArcCircle(Canvas canvas, Size size) {
    //
    //
    Paint paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Path path = Path();

    double x1 = size.width / 2;
    double y1 = size.height / 2;

    double x2 = size.width * 0.4;
    double y2 = size.height * 0.4;

    path.quadraticBezierTo(x1, y1, x2, y2);
    canvas.drawPath(path, paint);
  }

  void drawCircleContainerOutside(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = state.primaryColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), (size.width / 2), paint1);
  }

  void drawRectContainer(Canvas canvas, Size size) {
    double rectWidth = size.width / 2;
    double rectHeight = size.height * 0.1;

    canvas.drawRect(
        Rect.fromLTWH(
            size.width / 2 - rectWidth / 2,
            (size.height / 2 - rectHeight / 2) + size.height * 0.25,
            rectWidth,
            rectHeight),
        Paint()..color = state.terciaryColor);
  }

  void drawCircleContainer(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = state.secundaryColor
      ..strokeWidth = 28
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), (size.width / 2) - 14, paint1);
  }

  void drawImage(Canvas canvas, Size size) {
    double radio = size.width * 0.9;
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(size.width / 2 - radio / 2,
            size.height / 2 - radio / 2 + 10, radio, radio),
        image: state.uiImage!,
        filterQuality: FilterQuality.low,
        fit: BoxFit.contain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
