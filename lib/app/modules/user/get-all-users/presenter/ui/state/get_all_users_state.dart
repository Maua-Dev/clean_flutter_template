import '../../../../../../../shared/domain/entities/user.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';

abstract class GetAllUsersState {}

class StartGetAllState implements GetAllUsersState {
  const StartGetAllState();
}

class LoadingGetAllState implements GetAllUsersState {
  const LoadingGetAllState();
}

class ErrorGetAllState implements GetAllUsersState {
  final Failure error;
  const ErrorGetAllState(this.error);
}

class SuccessGetAllState implements GetAllUsersState {
  final List<User> user;
  const SuccessGetAllState(this.user);
}
