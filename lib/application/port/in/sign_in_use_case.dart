import 'package:app_pcp/application/port/out/session_storage.dart';

import '../out/user_repository.dart';

abstract class SignInUseCase {
  login(
      {required String username,
      required String password,
      required UserRepository repository,
      required SessionStorage sessionStorage});
}
