import 'package:app_pcp/features/flyer/bloc/flyer_bloc.dart';
import 'package:app_pcp/features/flyer/factory/flyer_factory.dart';
import 'package:app_pcp/features/flyer/widgets/face/face_3.dart';
import 'package:app_pcp/config/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  testGoldens('test flyer 2 default values', (WidgetTester tester) async {
    final FlyerBloc faceBloc = FlyerBloc();
    final byteData = await rootBundle.load(AppConstant.assetAvatar);

    await tester.runAsync(() async {
      await faceBloc.init(
        type: FlyerType.face,
        style: FaceType.face_3.name,
        primaryColor: Colors.white,
        secundaryColor: Colors.blue,
        terciaryColor: Colors.red,
        image: byteData.buffer.asUint8List(),
      );

      final widget = SizedBox(
        width: 250,
        height: 500,
        child: Face3(state: faceBloc.state),
      );

      final builder = GoldenBuilder.column()..addScenario('Default', widget);
      await tester.pumpWidgetBuilder(builder.build());
    });

    await screenMatchesGolden(tester, 'flyer_3');
  });

  testGoldens('test flyer 2 max length title 15', (WidgetTester tester) async {
    final FlyerBloc faceBloc = FlyerBloc();
    final byteData = await rootBundle.load(AppConstant.assetAvatar);

    await tester.runAsync(() async {
      await faceBloc.init(
        type: FlyerType.face,
        style: FaceType.face_3.name,
        primaryColor: Colors.white,
        secundaryColor: Colors.blue,
        terciaryColor: Colors.red,
        image: byteData.buffer.asUint8List(),
      );

      final widget = SizedBox(
        width: 250,
        height: 500,
        child: Face3(state: faceBloc.state),
      );

      final builder = GoldenBuilder.column()..addScenario('Default', widget);
      await tester.pumpWidgetBuilder(builder.build());
    });

    await screenMatchesGolden(tester, 'flyer_3_15_length');
  });
}
