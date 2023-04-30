import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:mobx/mobx.dart';

import 'states/create_user_state.dart';

part 'create_user_controller.g.dart';

class CreateUserController = CreateUserControllerBase
    with _$CreateUserController;

abstract class CreateUserControllerBase with Store {
  final ICreateUserUsecase createUserUsecase;

  CreateUserControllerBase(this.createUserUsecase);

  @observable
  UserModel userToCreate = UserModel.newInstance();

  @observable
  CreateUserState state = const StartCreateState();

  @action
  Future<void> createUser() async {
    setState(const LoadingCreateState());
    var result = await createUserUsecase(userToCreate);
    setState(
        result.fold((l) => ErrorCreateState(l), (r) => SuccessCreateState(r)));
  }

  @action
  setUserName(String name) => userToCreate.copyWith(name: name);

  @action
  setUserEmail(String email) => userToCreate.copyWith(email: email);

  @action
  setUserPassword(String password) => userToCreate.copyWith(password: password);

  @action
  void setState(CreateUserState value) => state = value;
}
