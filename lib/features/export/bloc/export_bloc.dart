import 'package:app_pcp/application/port/out/session_storage.dart';
import 'package:app_pcp/application/port/out/user_repository.dart';
import 'package:app_pcp/features/export/bloc/export_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportBloc extends Cubit<ExportState> {
  final SessionStorage sessionStorage;
  final UserRepository userRepository;

  ExportBloc({required this.sessionStorage, required this.userRepository})
      : super(ExportState());

  init() async {
    debugPrint('init export bloc ...');

    emit(state.copyWith(status: ExportStatus.loading));

    bool isSignIn = await sessionStorage.isSignIn();

    isSignIn
        ? emit(state.copyWith(status: ExportStatus.loaded))
        : emit(state.copyWith(status: ExportStatus.error));

    debugPrint('isSignIn $isSignIn');
  }
}
