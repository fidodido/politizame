import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import '../../settings/screens/flyer_settings.dart';
import '../bloc/flyer_bloc.dart';
import '../bloc/flyer_state.dart';
import '../factory/flyer_factory.dart';

class CircleScreen extends StatefulWidget {
  final FlyerBloc bloc;
  const CircleScreen({super.key, required this.bloc});
  @override
  State<CircleScreen> createState() => CircleScreenState();
}

class CircleScreenState extends State<CircleScreen> {
  ui.Image? image;
  ui.Image? logo;
  bool loaded = false;
  Offset translationUpdater = Offset.zero;
  Matrix4 transform = Matrix4.identity();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double maxWith = 300;
    const double maxHeight = 300;
    final width = MediaQuery.of(context).size.width;

    double withResponsive = width > 400 ? maxWith : width * 0.8;
    double heightResponsive = width > 400 ? maxHeight : width * 0.8;

    return BlocBuilder<FlyerBloc, FlyerState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state.status == FlyerStatus.loaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
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
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(withResponsive),
                              //set border radius more than 50% of height and width to make circle
                            ),
                            elevation: 12,
                            child: CircleAvatar(
                              radius: withResponsive,
                              child: SizedBox(
                                width: withResponsive,
                                height: heightResponsive,
                                child: FlyerFactory.create(state, state.style!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 100,
                  child: Center(
                      child: FlyerSettings(
                    bloc: widget.bloc,
                  ))),
            ],
          );
        }
        return Container();
      },
    );
  }
}
