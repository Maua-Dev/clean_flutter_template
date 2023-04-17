import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/repositories/user_repository_interface.dart';

import '../../domain/enums/state_enum.dart';
import '../../helpers/errors/usecase_errors.dart';

class UserRepositoryMock implements IUserRepository {
  List<User> users = [];

  UserRepositoryMock() {
    users = [
      User(
        id: '0',
        name: 'Gabriel Godoy',
        email: 'gabriel.godoybz@hotmail.com',
        password: 'Teste123!',
        state: StateEnum.APPROVED,
      ),
      User(
        id: '1',
        name: 'Vitor Soller',
        email: 'sollerzin@gmail.com',
        password: 'Teste123!',
        state: StateEnum.REJECTED,
      ),
    ];
  }

  @override
  Future<User> createUser(User user) async {
    users.add(user);
    return user;
  }

  @override
  Future<User> deleteUser(String id) async {
    for (var i = 0; i < users.length; i++) {
      if (users[i].id == id) {
        return users.removeAt(i);
      }
    }
    throw NoItemsFound(message: "user_id");
  }

  @override
  Future<List<User>> getAllUsers() async {
    return users;
  }

  @override
  Future<User> getUser(String id) async {
    for (var user in users) {
      if (user.id == id) {
        return user;
      }
    }
    throw NoItemsFound(message: "user_id");
  }

  @override
  Future<User> updateUser(User userToUpdate) async {
    for (var user in users) {
      if (user.id == userToUpdate.id) {
        user = userToUpdate;
        return user;
      }
    }
    throw NoItemsFound(message: "user_id");
  }
}
