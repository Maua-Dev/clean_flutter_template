import 'package:clean_flutter_template/app/modules/create-user/presenter/controller/create_user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../shared/datasource/external/http/user_datasource.dart';
import '../../../../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../../../../shared/domain/usecases/create_user_usecase.dart';
import '../../../../../../shared/helpers/services/dio_http_request.dart';
import '../../../../../../shared/infra/repositories/user_repository_mock.dart';
import '../../../../../../shared/infra/storage/local_storage.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState
    extends ModularState<CreateUserPage, CreateUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
