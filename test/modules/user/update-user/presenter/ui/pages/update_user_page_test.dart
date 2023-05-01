import 'package:clean_flutter_template/app/modules/user/update-user/presenter/controller/update_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/update-user/update_user_module.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/usecases/update_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import '../../controller/update_user_controller_test.mocks.dart';

@GenerateMocks([UpdateUserUsecase])
void main() {
  late UpdateUserController controller;
  UpdateUserUsecase usecase = MockUpdateUserUsecase();

  String name = "Gabriel Godoy";
  String email = "gabriel.godoybz@hotmail.com";
  String password = "Teste123!";

  setUp(() async {
    initModules([
      UpdateUserModule()
    ], replaceBinds: [
      modular.Bind<IUpdateUserUsecase>((i) => usecase),
    ]);
    controller = Modular.get<UpdateUserController>();
    usecase = Modular.get<UpdateUserUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });
}
