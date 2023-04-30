import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/create_user_usecase.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:mobx/mobx.dart';

import '../states/create_user_state.dart';

part 'create_user_controller.g.dart';

class CreateUserController = CreateUserControllerBase
    with _$CreateUserController;

abstract class CreateUserControllerBase with Store {
  final ICreateUserUsecase createUserUsecase;

  CreateUserControllerBase(this.createUserUsecase);

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  String userPassword = '';

  @observable
  StateEnum userState = StateEnum.REJECTED;

  @observable
  String userId = '';

  @observable
  CreateUserState state = const StartCreateState();

  @action
  Future<void> createUser() async {
    setPageState(const LoadingCreateState());
    var result = await createUserUsecase(userName, userEmail, userPassword);
    setPageState(
        result.fold((l) => ErrorCreateState(l), (r) => SuccessCreateState(r)));
  }

  @action
  setUserName(String name) => userName = name;

  @action
  setUserEmail(String email) => userEmail = email;

  @action
  setUserPassword(String password) => userPassword = password;

  @action
  setPageState(CreateUserState value) => state = value;
}
