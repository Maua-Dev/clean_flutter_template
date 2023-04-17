import '../entities/user.dart';

abstract class IUserRepository {
  Future<User> getUser(String id);
  Future<List<User>> getAllUsers();
  Future<void> createUser(User user);
  Future<void> deleteUser(String id);
  Future<void> updateUser(User user);
}
