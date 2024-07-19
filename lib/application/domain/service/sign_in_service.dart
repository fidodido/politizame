import 'package:app_pcp/application/port/out/session_storage.dart';
import 'package:flutter/widgets.dart';

import '../../port/in/sign_in_use_case.dart';
import '../../port/out/user_repository.dart';
import '../model/user.dart';

class SignInService implements SignInUseCase {
  @override
  login(
      {required String username,
      required String password,
      required UserRepository repository,
      required SessionStorage sessionStorage}) async {
    debugPrint('init sign in use case ...');
    // create the new user.
    User user = User(id: 1, username: username, isSignIn: false);
    // save user to persistence.
    await repository.save(user);
    // save session of user.
    await sessionStorage.save(user);
  }
}
