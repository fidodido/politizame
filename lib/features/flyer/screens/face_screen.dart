import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import '../../settings/screens/flyer_settings.dart';
import '../bloc/flyer_bloc.dart';
import '../bloc/flyer_state.dart';
import '../factory/flyer_factory.dart';

class FaceScreen extends StatefulWidget {
  final FlyerBloc bloc;
  const FaceScreen({super.key, required this.bloc});
  @override
  State<FaceScreen> createState() => FaceScreenState();
}

class FaceScreenState extends State<FaceScreen> {
  ui.Image? image;
  ui.Image? logo;
  Offset translationUpdater = Offset.zero;
  Matrix4 transform = Matrix4.identity();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double maxWith = 300;
    const double maxHeight = 500;
    final width = MediaQuery.of(context).size.width;

    double withResponsive = width > 400 ? maxWith : width * 0.8;
    double heightResponsive = width > 400 ? maxHeight : width;

    return BlocBuilder<FlyerBloc, FlyerState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state.status == FlyerStatus.loaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: SizedBox(
                      width: withResponsive,
                      height: heightResponsive,
                      child: Screenshot(
                        controller: state.controller,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 12,
                              child: SizedBox(
                                width: withResponsive,
                                height: heightResponsive,
                                child: FlyerFactory.create(state, state.style!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 90,
                    child: Center(
                        child: FlyerSettings(
                      bloc: widget.bloc,
                    ))),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
