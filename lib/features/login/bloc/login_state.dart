enum LoginStatus { initial, loading, error, loaded }

class LoginState {
  final LoginStatus status;

  LoginState({
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    LoginStatus? status,
  }) =>
      LoginState(
        status: status ?? this.status,
      );
}
