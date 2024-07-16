import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/models/palette.dart';

enum FormBlocStatus { initial, loading, error, loaded }

class FormBlocState {
  final FormBlocStatus status;
  final Color primaryColor;
  final Color secundaryColor;
  final Color terciaryColor;
  final Uint8List? image;

  Palette? palette = Palette(
      id: 1,
      title: 'Normal',
      selected: false,
      colors: ['292f36', '4ecdc4', 'ff6b6b']);

  FormBlocState(
      {this.status = FormBlocStatus.initial,
      this.palette,
      this.primaryColor = Colors.black,
      this.secundaryColor = Colors.orangeAccent,
      this.terciaryColor = Colors.orangeAccent,
      this.image});

  FormBlocState copyWith(
          {FormBlocStatus? status,
          Palette? palette,
          Color? primaryColor,
          Color? secundaryColor,
          Color? terciaryColor,
          Uint8List? image}) =>
      FormBlocState(
        status: status ?? this.status,
        palette: palette ?? this.palette,
        primaryColor: primaryColor ?? this.primaryColor,
        secundaryColor: secundaryColor ?? this.secundaryColor,
        terciaryColor: terciaryColor ?? this.terciaryColor,
        image: image ?? this.image,
      );
}
