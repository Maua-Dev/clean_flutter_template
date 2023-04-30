// ignore_for_file: constant_identifier_names

import 'package:clean_flutter_template/shared/infra/external/http/user_datasource_interface.dart';
import 'package:clean_flutter_template/shared/infra/repositories/user_repository_http.dart';
import 'package:clean_flutter_template/shared/infra/repositories/user_repository_mock.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/repositories/user_repository_interface.dart';
import '../helpers/enums/environment_enum.dart';

class EnvironmentConfig {
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static IUserRepository getUserRepo() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) => element.toString() == ENV,
      orElse: () => EnvironmentEnum.DEV,
    );
    if (value == EnvironmentEnum.DEV) {
      return UserRepositoryMock();
    }
    // else if (value == EnvironmentEnum.HOMOLOG) {
    //   return UserRepositoryHttp(datasource: Modular.get<IUserDatasource>());
    // }
    // else if (value == EnvironmentEnum.PROD) {
    //   return null;
    else {
      throw Exception("No repository found for this stage");
    }
  }
}
