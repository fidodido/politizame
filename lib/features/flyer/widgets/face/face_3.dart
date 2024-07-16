import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/flyer_state.dart';
import '../../utils/app_custom_painter.dart';

class Face3 extends StatelessWidget {
  final FlyerState state;
  const Face3({super.key, required this.state});

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
                  CustomPaint(painter: Flyer1Canvas(state: state)),
                  Positioned(
                    top: flyerHeight * 0.62,
                    child: Transform.rotate(
                      angle: 0,
                      child: Container(
                        width: flyerWidth,
                        height: flyerHeight * 0.25,
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(state.text1.toUpperCase(),
                                    style: GoogleFonts.outfit(
                                      color: state.primaryColor,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: flyerHeight * 0.1,
                                    )),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(state.text2,
                                    style: GoogleFonts.outfit(
                                      color: state.primaryColor,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: flyerHeight * 0.05,
                                    )),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Image.memory(
                        state.logo!,
                        height: flyerHeight * 0.12,
                        fit: BoxFit.fitWidth,
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Flyer1Canvas extends AppCustomPainterUtils implements AppCustomPainter {
  final FlyerState state;
  Flyer1Canvas({required this.state});

  @override
  void paint(Canvas canvas, Size size) {
    drawBackground(canvas, size);
    drawTopBar(canvas, size);
    drawImage(canvas, size);
    drawBottomBar(canvas, size);
  }

  void drawBackground(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()
          ..color = state.primaryColor
          ..style = PaintingStyle.fill);
  }

  void drawTopBar(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(0, size.height * 0.5);
    path.close();

    canvas.drawPath(
        path,
        Paint()
          ..color = state.secundaryColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 0);
  }

  void drawBottomBar(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(0, size.height * 0.9);
    path.close();

    canvas.drawPath(
        path,
        Paint()
          ..color = state.terciaryColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 0);
  }

  void drawImage(Canvas canvas, Size size) {
    if (state.image != null) {
      Rect rect = Rect.fromLTWH(size.width / 2 - (size.width / 2),
          size.height * 0.1, size.width, size.height * 0.7);

      paintImage(
          canvas: canvas,
          rect: rect,
          image: state.uiImage!,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
