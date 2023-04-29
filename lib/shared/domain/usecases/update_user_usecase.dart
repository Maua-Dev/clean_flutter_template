import 'package:dartz/dartz.dart';

import '../../helpers/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../entities/user.dart';
import '../repositories/user_repository_interface.dart';

abstract class IUpdateUserUsecase {
  Future<Either<Failure, User>> call(UserModel user);
}

class UpdateUserUsecase implements IUpdateUserUsecase {
  final IUserRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(UserModel user) async {
    return await repository.updateUser(user);
  }
}
