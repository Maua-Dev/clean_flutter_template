import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/helpers/errors/erros.dart';
import 'package:clean_flutter_template/shared/infra/repositories/user_repository_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UserRepositoryMock repository = UserRepositoryMock();

  var user = User(
    id: '0',
    name: 'Vitor Soller',
    email: 'gabriel.godoybz@hotmail.com',
    password: 'Teste123!',
    state: StateEnum.APPROVED,
  );

  group('[TEST] - createUser', () {
    test('Should return a user', () async {
      var response = await repository.createUser(user);
      expect(response, user);
    });
  });

  group('[TEST] - deleteUser', () {
    test('Should return a user', () async {
      var lenthBefore = repository.users.length;
      var response = await repository.deleteUser('0');
      var lenthAfter = repository.users.length;
      expect(response.id, user.id);
      expect(lenthAfter, lenthBefore - 1);
    });

    test('Should throw NoItemsFound', () async {
      try {
        await repository.deleteUser('0');
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });

  group('[TEST] - getAllUsers', () {
    test('Should return a list of users', () async {
      var response = await repository.getAllUsers();
      expect(response, repository.users);
    });
  });

  group('[TEST] - getUser', () {
    test('Should return a user', () async {
      var response = await repository.getUser('0');
      expect(response.id, user.id);
    });

    test('Should throw NoItemsFound', () async {
      try {
        await repository.getUser('0');
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });

  group('[TEST] - updateUser', () {
    test('Should return a user', () async {
      var response = await repository.updateUser(user);
      expect(response.name, user.name);
    });

    test('Should throw NoItemsFound', () async {
      try {
        await repository.updateUser(user);
      } catch (e) {
        expect(e, isA<NoItemsFound>());
      }
    });
  });
}
