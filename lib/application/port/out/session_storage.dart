import '../../domain/model/user.dart';

abstract class SessionStorage {
  Future<void> save(User user);
  Future<bool> isSignIn();
}
