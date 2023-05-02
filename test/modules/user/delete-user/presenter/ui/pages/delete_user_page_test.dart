import 'package:clean_flutter_template/app/modules/user/delete-user/delete_user_module.dart';
import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/controller/delete_user_controller.dart';
import 'package:clean_flutter_template/app/modules/user/delete-user/presenter/ui/pages/delete_user_page.dart';
import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/domain/usecases/delete_user_usecase.dart';
import 'package:clean_flutter_template/shared/helpers/errors/errors.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:clean_flutter_template/shared/widgets/footer_widget.dart';
import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:clean_flutter_template/shared/widgets/text_field_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'delete_user_page_test.mocks.dart';

@GenerateMocks([DeleteUserUsecase])
void main() {
  late DeleteUserController controller;
  DeleteUserUsecase usecase = MockDeleteUserUsecase();

  String name = "Gabriel Godoy";
  String email = "gabriel.godoybz@hotmail.com";
  String password = "Teste123!";

  setUp(() async {
    initModules([
      DeleteUserModule()
    ], replaceBinds: [
      modular.Bind<IDeleteUserUsecase>((i) => usecase),
    ]);
    controller = Modular.get<DeleteUserController>();
    usecase = Modular.get<DeleteUserUsecase>();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  testWidgets('[TEST] - DeleteUserPage must show some widgets when initialize',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const DeleteUserPage()));
    expect(find.byType(LogoWidget), findsOneWidget);
    expect(find.text(S.current.deletePageTitle), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(TextFieldWidget), findsNWidgets(1));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(S.current.deleteTitle), findsOneWidget);
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });

  testWidgets(
      '[TEST] - DeleteUserPage must show SuccessWidget when delete user',
      (widgetTester) async {
    var userModel = UserModel(
      name: name,
      email: email,
      password: password,
      state: StateEnum.REJECTED,
      id: '0',
    );
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const DeleteUserPage()));
    when(usecase.call('0')).thenAnswer((_) async => Right(userModel));
    await widgetTester.runAsync(() async => controller.setUserId('0'));
    await widgetTester.runAsync(() async => controller.deleteUser());
    await widgetTester.pump();

    expect(find.text(S.current.successDeleteUser('', name)), findsOneWidget);
  });

  testWidgets('[TEST] - DeleteUserPage must show ErrorWidget when delete user',
      (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const DeleteUserPage()));
    when(usecase.call('10000'))
        .thenAnswer((_) async => left(ErrorRequest(message: 'message')));
    await widgetTester.runAsync(() async => controller.setUserId('10000'));
    await widgetTester.runAsync(() async => controller.deleteUser());
    await widgetTester.pump();

    expect(find.text(S.current.requestErrorMessage('', 'message')),
        findsOneWidget);
  });
}
