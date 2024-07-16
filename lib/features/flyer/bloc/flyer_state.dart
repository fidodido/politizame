import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:screenshot/screenshot.dart';
import '../factory/flyer_factory.dart';

enum FlyerStatus { initial, loading, error, loaded }

class FlyerState extends Equatable {
  final FlyerStatus status;
  final FlyerType? type;
  final int paletteIndex;
  final Color primaryColor;
  final Color secundaryColor;
  final Color terciaryColor;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final Color textColor;
  final String textFontFamily;
  final String? style;
  final int styleIndex;
  final Uint8List? image;
  final ui.Image? uiImage;
  final Uint8List? logo;
  final ui.Image? uiLogo;
  final Rect rect;
  final ScreenshotController controller = ScreenshotController();

  FlyerState(
      {this.status = FlyerStatus.initial,
      this.type,
      this.primaryColor = Colors.white,
      this.secundaryColor = Colors.blue,
      this.terciaryColor = Colors.red,
      this.text1 = 'text 1',
      this.text2 = 'text 2',
      this.text3 = 'text 3',
      this.text4 = 'text 4',
      this.text5 = 'text 5',
      this.text6 = 'text 6',
      this.textColor = Colors.white,
      this.paletteIndex = 0,
      this.textFontFamily = 'Exo 2',
      this.style,
      this.image,
      this.uiImage,
      this.logo,
      this.uiLogo,
      this.rect = const Rect.fromLTWH(0, 0, 100, 100),
      this.styleIndex = 0});

  FlyerState copyWith(
          {FlyerStatus? status,
          int? paletteIndex,
          Color? primaryColor,
          Color? secundaryColor,
          Color? terciaryColor,
          String? text1,
          String? text2,
          String? text3,
          String? text4,
          String? text5,
          String? text6,
          Color? textColor,
          Color? text2Color,
          String? logoUrl,
          String? avatarUrl,
          String? textFontFamily,
          String? style,
          Uint8List? image,
          ui.Image? uiImage,
          Uint8List? logo,
          ui.Image? uiLogo,
          Rect? rect,
          FlyerType? type,
          int? styleIndex}) =>
      FlyerState(
          status: status ?? this.status,
          paletteIndex: paletteIndex ?? this.paletteIndex,
          primaryColor: primaryColor ?? this.primaryColor,
          secundaryColor: secundaryColor ?? this.secundaryColor,
          terciaryColor: terciaryColor ?? this.terciaryColor,
          text1: text1 ?? this.text1,
          text2: text2 ?? this.text2,
          text3: text3 ?? this.text3,
          text4: text4 ?? this.text4,
          text5: text5 ?? this.text5,
          text6: text6 ?? this.text6,
          textColor: textColor ?? this.textColor,
          textFontFamily: textFontFamily ?? this.textFontFamily,
          style: style ?? this.style,
          image: image ?? this.image,
          uiImage: uiImage ?? this.uiImage,
          logo: logo ?? this.logo,
          uiLogo: uiLogo ?? this.uiLogo,
          type: type ?? this.type,
          rect: rect ?? this.rect,
          styleIndex: styleIndex ?? this.styleIndex);

  @override
  List<Object> get props => [
        status,
        paletteIndex,
        primaryColor,
        secundaryColor,
        terciaryColor,
        text1,
        text2,
        text3,
        text4,
        text5,
        text6,
        textColor,
        textFontFamily,
        styleIndex,
        rect,
        controller,
      ];
}
