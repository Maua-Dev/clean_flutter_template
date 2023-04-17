import '../entities/user.dart';

abstract class IUserRepository {
  Future<User> getUser(String id);
  Future<List<User>> getAllUsers();
  Future<User> createUser(User user);
  Future<User> deleteUser(String id);
  Future<User> updateUser(User userToUpdate);
}
