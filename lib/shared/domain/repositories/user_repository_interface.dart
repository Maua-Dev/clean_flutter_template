import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../helpers/errors/infra_errors.dart';
import '../entities/user.dart';

abstract class IUserRepository {
  Future<Either<InfraErrors, User>> getUser(String id);
  Future<Either<InfraErrors, List<User>>> getAllUsers();
  Future<Either<InfraErrors, User>> createUser(UserModel user);
  Future<Either<InfraErrors, User>> deleteUser(String id);
  Future<Either<InfraErrors, User>> updateUser(UserModel userToUpdate);
}
