import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class ICreateUserUsecase {
  Future<Either<Failure, User>> call(UserModel user);
}

class CreateUserUsecase implements ICreateUserUsecase {
  final IUserRepository repository;

  CreateUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(UserModel user) async {
    return await repository.createUser(user);
  }
}
