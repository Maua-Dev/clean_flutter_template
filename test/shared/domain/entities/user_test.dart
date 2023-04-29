import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('[TEST] - user', () {
    expect(
      () => User(
        id: '0',
        name: 'Vitor Soller',
        email: 'gabriel.godoybz@hotmail.com',
        password: 'Teste123!',
        state: StateEnum.APPROVED,
      ),
      isNotNull,
    );
  });

  test('[TEST] - throw EntityError with invalid name', () {
    expect(
      () => User(
        name: 'g',
        email: "gabriel.braz@maua.br",
        password: '1234567',
        id: '1',
        state: StateEnum.APPROVED,
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });

  test('[TEST] - throw EntityError with invalid email', () {
    expect(
      () => User(
        name: 'gabriel',
        email: "gabriel.braz.com",
        password: '1234567',
        id: '1',
        state: StateEnum.APPROVED,
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });

  test('[TEST] - throw EntityError with invalid password', () {
    expect(
      () => User(
        name: 'gabriel',
        email: "gabriel.braz@maua.br",
        password: '123',
        id: '1',
        state: StateEnum.APPROVED,
      ),
      throwsA(isInstanceOf<EntityError>()),
    );
  });
}
