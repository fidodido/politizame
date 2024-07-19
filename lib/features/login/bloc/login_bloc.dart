import 'package:app_pcp/application/port/out/session_storage.dart';
import 'package:app_pcp/features/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/domain/service/sign_in_service.dart';
import '../../../application/port/out/user_repository.dart';

class LoginBloc extends Cubit<LoginState> {
  final SessionStorage sessionStorage;
  final UserRepository userRepository;
  final SignInService signInService;

  LoginBloc(
      {required this.sessionStorage,
      required this.userRepository,
      required this.signInService})
      : super(LoginState());

  login(String username, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await signInService.login(
          username: username,
          password: password,
          repository: userRepository,
          sessionStorage: sessionStorage);

      emit(state.copyWith(status: LoginStatus.loaded));
    } on Exception catch (_) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
