// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserController on CreateUserControllerBase, Store {
  late final _$userToCreateAtom =
      Atom(name: 'CreateUserControllerBase.userToCreate', context: context);

  @override
  UserModel get userToCreate {
    _$userToCreateAtom.reportRead();
    return super.userToCreate;
  }

  @override
  set userToCreate(UserModel value) {
    _$userToCreateAtom.reportWrite(value, super.userToCreate, () {
      super.userToCreate = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'CreateUserControllerBase.state', context: context);

  @override
  CreateUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CreateUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$createUserAsyncAction =
      AsyncAction('CreateUserControllerBase.createUser', context: context);

  @override
  Future<void> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  late final _$CreateUserControllerBaseActionController =
      ActionController(name: 'CreateUserControllerBase', context: context);

  @override
  dynamic setUserName(String name) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setUserName');
    try {
      return super.setUserName(name);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserEmail(String email) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setUserEmail');
    try {
      return super.setUserEmail(email);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserPassword(String password) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setUserPassword');
    try {
      return super.setUserPassword(password);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(CreateUserState value) {
    final _$actionInfo = _$CreateUserControllerBaseActionController.startAction(
        name: 'CreateUserControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$CreateUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userToCreate: ${userToCreate},
state: ${state}
    ''';
  }
}
