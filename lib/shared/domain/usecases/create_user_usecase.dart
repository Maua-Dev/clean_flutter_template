import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, User>> call(
      String name, String email, String password);
}

class CreateUserUsecase implements ICreateUserUsecase {
  final IUserRepository repository;

  CreateUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(
      String name, String email, String password) async {
    UserModel userToCreate = UserModel(
      email: email,
      name: name,
      password: password,
      state: StateEnum.REJECTED,
      id: '',
    );
    return await repository.createUser(userToCreate);
  }
}
