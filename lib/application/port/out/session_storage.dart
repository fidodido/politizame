import '../../domain/model/user.dart';

abstract class SessionStorage {
  save(User user) {}
}
