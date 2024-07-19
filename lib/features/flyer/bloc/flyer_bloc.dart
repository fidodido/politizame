import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import '../../../application/domain/model/palette.dart';
import '../../../config/app_constant.dart';
import '../../../config/app_utils.dart';
import '../factory/flyer_factory.dart';
import 'flyer_state.dart';

enum ScreenType { face, flag, circle }

class FlyerBloc extends Cubit<FlyerState> {
  FlyerBloc() : super(FlyerState());

  Future<void> init(
      {required FlyerType type,
      required String style,
      required Color primaryColor,
      required Color secundaryColor,
      required Color terciaryColor,
      required Uint8List image}) async {
    final ui.Image uiImage = await AppUtils.loadUiImageFromData(image);
    final byteData = await rootBundle.load(AppConstant.assetLogo);
    final logo = byteData.buffer.asUint8List();
    final ui.Image uiLogo = await AppUtils.loadUiImageFromData(logo);

    emit(state.copyWith(
      type: type,
      style: style,
      status: FlyerStatus.loaded,
      primaryColor: primaryColor,
      secundaryColor: secundaryColor,
      terciaryColor: terciaryColor,
      image: image,
      uiImage: uiImage,
      logo: logo,
      uiLogo: uiLogo,
    ));
  }

  Future<void> setPrimaryColor(Color color) async {
    emit(state.copyWith(primaryColor: color));
  }

  Future<void> setSecundaryColor(Color color) async {
    emit(state.copyWith(secundaryColor: color));
  }

  Future<void> setTerciaryColor(Color color) async {
    emit(state.copyWith(terciaryColor: color));
  }

  Future<void> setText1(String text1) async {
    emit(state.copyWith(text1: text1));
  }

  Future<void> setText2(String text2) async {
    emit(state.copyWith(text2: text2));
  }

  Future<void> setText3(String text3) async {
    emit(state.copyWith(text3: text3));
  }

  Future<void> setText4(String text4) async {
    emit(state.copyWith(text4: text4));
  }

  Future<void> setText5(String text5) async {
    emit(state.copyWith(text5: text5));
  }

  Future<void> setText6(String text6) async {
    emit(state.copyWith(text6: text6));
  }

  Future<void> setTextColor(Color color) async {
    emit(state.copyWith(textColor: color));
  }

  Future<void> setImage(Uint8List image) async {
    ui.Image uiImage = await AppUtils.bytesToImage(image);
    emit(state.copyWith(image: image, uiImage: uiImage));
  }

  Future<void> setLogo(Uint8List logo) async {
    ui.Image uiLogo = await AppUtils.bytesToImage(logo);
    emit(state.copyWith(logo: logo, uiLogo: uiLogo));
  }

  Future<void> setTextFontFamily(String textFontFamily) async {
    emit(state.copyWith(textFontFamily: textFontFamily));
  }

  Future<void> setRect(Rect rect) async {
    emit(state.copyWith(rect: rect));
  }

  Future<void> setStyle() async {
    int nextIndex = FlyerFactory.next(state, state.type!, state.styleIndex);
    String style = FlyerFactory.findByIndex(state, state.type!, nextIndex);

    emit(state.copyWith(styleIndex: nextIndex, style: style));
  }

  Future<void> setPalette() async {
    int next = AppConstant.paletteList.length - 1 == state.paletteIndex
        ? 0
        : state.paletteIndex + 1;

    Palette palette = AppConstant.paletteList[next];

    Color primaryColor = Color(int.parse('0xFF${palette.colors[0]}'));
    Color secundaryColor = Color(int.parse('0xFF${palette.colors[1]}'));
    Color terciaryColor = Color(int.parse('0xFF${palette.colors[2]}'));

    emit(state.copyWith(
        paletteIndex: next,
        primaryColor: primaryColor,
        secundaryColor: secundaryColor,
        terciaryColor: terciaryColor));
  }
}
