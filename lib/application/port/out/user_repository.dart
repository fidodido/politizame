import '../../domain/model/user.dart';

abstract class UserRepository {
  Future<void> save(User user);
}
