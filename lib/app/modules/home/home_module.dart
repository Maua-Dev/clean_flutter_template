import 'package:clean_flutter_template/app/modules/home/presenter/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) =>
              const HomePage(title: 'Flutter Demo Home Page'),
        )
      ];
}
