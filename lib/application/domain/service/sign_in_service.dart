import 'package:app_pcp/application/port/out/session_storage.dart';

import '../../port/in/sign_in_use_case.dart';
import '../../port/out/user_repository.dart';
import '../model/user.dart';

class SignInService implements SignInUseCase {
  @override
  login(
      {required String username,
      required String password,
      required UserRepository repository,
      required SessionStorage sessionStorage}) {
    // create the new user.
    User user = User(id: 1, username: username, isSignIn: false);
    // save user to persistence.
    repository.save(user);
    // save session of user.
    sessionStorage.save(user);
  }
}
