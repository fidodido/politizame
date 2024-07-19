import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../application/domain/model/palette.dart';

enum FormStatus { initial, loading, error, loaded }

class FormState {
  final FormStatus status;
  final Color primaryColor;
  final Color secundaryColor;
  final Color terciaryColor;
  final Uint8List? image;

  Palette? palette = Palette(
      id: 1,
      title: 'Normal',
      selected: false,
      colors: ['292f36', '4ecdc4', 'ff6b6b']);

  FormState(
      {this.status = FormStatus.initial,
      this.palette,
      this.primaryColor = Colors.black,
      this.secundaryColor = Colors.orangeAccent,
      this.terciaryColor = Colors.orangeAccent,
      this.image});

  FormState copyWith(
          {FormStatus? status,
          Palette? palette,
          Color? primaryColor,
          Color? secundaryColor,
          Color? terciaryColor,
          Uint8List? image}) =>
      FormState(
        status: status ?? this.status,
        palette: palette ?? this.palette,
        primaryColor: primaryColor ?? this.primaryColor,
        secundaryColor: secundaryColor ?? this.secundaryColor,
        terciaryColor: terciaryColor ?? this.terciaryColor,
        image: image ?? this.image,
      );
}
