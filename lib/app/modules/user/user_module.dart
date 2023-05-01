import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/datasource/external/http/user_datasource.dart';
import '../../../shared/domain/repositories/user_repository_interface.dart';
import '../../../shared/environment/environment_config.dart';
import '../../../shared/helpers/services/dio_http_request.dart';
import '../../../shared/helpers/services/dio_options.dart';
import '../../../shared/helpers/services/http_request_interface.dart';
import '../../../shared/infra/external/http/user_datasource_interface.dart';
import 'create-user/create_user_module.dart';
import 'home/presenter/ui/pages/home_page.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(userOptions)),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>()), export: true),
        Bind<IUserDatasource>((i) => UserDatasource(i<IHttpRequest>()),
            export: true),
        Bind<IUserRepository>((i) {
          return EnvironmentConfig.getUserRepo();
        }, export: true),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute(
          '/create-user',
          module: CreateUserModule(),
        ),
      ];
}
