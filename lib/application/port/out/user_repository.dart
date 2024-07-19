import '../../domain/model/user.dart';

abstract class UserRepository {
  save(User user) {}

  findById(String id) {}
}
