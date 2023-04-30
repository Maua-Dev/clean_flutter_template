import 'package:clean_flutter_template/app/modules/create-user/create_user_module.dart';
import 'package:clean_flutter_template/shared/datasource/external/http/user_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/domain/repositories/user_repository_interface.dart';
import '../shared/environment/environment_config.dart';
import '../shared/helpers/services/dio_http_request.dart';
import '../shared/helpers/services/dio_options.dart';
import '../shared/helpers/services/http_request_interface.dart';
import '../shared/infra/external/http/user_datasource_interface.dart';

class AppModule extends Module {
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
        ModuleRoute(
          Modular.initialRoute,
          module: CreateUserModule(),
        ),
      ];
}
