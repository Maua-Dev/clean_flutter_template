import 'package:clean_flutter_template/app/modules/user/get-all-users/get_all_users_module.dart';
import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/controllers/get_all_users_controller.dart';
import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/ui/pages/get_all_users_page.dart';
import 'package:clean_flutter_template/app/modules/user/get-all-users/presenter/ui/widgets/user_widget.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/get_all_users_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/widgets/footer_widget.dart';
import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'get_all_users_page_test.mocks.dart';

@GenerateMocks([GetAllUsersUsecase])
void main() {
  // ignore: unused_local_variable
  late GetAllUsersController controller;
  GetAllUsersUsecase usecase = MockGetAllUsersUsecase();

  var listUsers = [
    UserModel(
      name: 'Gabriel',
      email: 'gabriel.godoybz@hotmail.com',
      password: 'Teste123!',
      state: StateEnum.REJECTED,
      id: '0',
    ),
  ];

  setUp(() async {
    initModules([
      GetAllUsersModule()
    ], replaceBinds: [
      modular.Bind<IGetAllUsersUsecase>((i) => usecase),
    ]);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets(
      '[TEST] - GetAllUsersPage must show some widgets when getAll is OK',
      (widgetTester) async {
    when(usecase()).thenAnswer((_) async => Right(listUsers));
    controller = Modular.get<GetAllUsersController>();
    usecase = Modular.get<GetAllUsersUsecase>();
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const GetAllUsersPage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.getAllPageTitle), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(UserWidget), findsNWidgets(1));
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });

  testWidgets(
      '[TEST] - GetAllUsersPage must show some widgets when getAll is Error',
      (widgetTester) async {
    when(usecase())
        .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
    controller = Modular.get<GetAllUsersController>();
    usecase = Modular.get<GetAllUsersUsecase>();
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const GetAllUsersPage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.getAllPageTitle), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
    expect(find.byType(UserWidget), findsNothing);
    expect(find.text('message'), findsOneWidget);
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });
}
