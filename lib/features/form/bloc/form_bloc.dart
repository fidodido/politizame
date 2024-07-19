import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/domain/model/palette.dart';
import '../../../utils/app_constant.dart';
import 'form_bloc_state.dart';

class FormBloc extends Cubit<FormBlocState> {
  FormBloc() : super(FormBlocState());

  Future<void> init() async {
    final byteData = await rootBundle.load(AppConstant.assetAvatar);
    final Uint8List image = byteData.buffer.asUint8List();
    emit(state.copyWith(image: image, status: FormBlocStatus.loaded));
  }

  Future<void> setPalette(Palette palette) async {
    emit(state.copyWith(palette: palette));
  }

  Future<void> setPrimaryColor(Color primaryColor) async {
    emit(state.copyWith(primaryColor: primaryColor));
  }

  Future<void> setSecundaryColor(Color secundaryColor) async {
    emit(state.copyWith(secundaryColor: secundaryColor));
  }

  Future<void> setTerciaryColor(Color terciaryColor) async {
    emit(state.copyWith(terciaryColor: terciaryColor));
  }

  Future<void> setImage(Uint8List image) async {
    emit(state.copyWith(image: image));
  }
}
