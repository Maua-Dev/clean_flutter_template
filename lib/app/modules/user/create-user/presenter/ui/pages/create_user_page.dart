import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controller/create_user_controller.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<CreateUserController>();
    return Scaffold(
        body: Column(
      children: [Image(image: AssetImage('assets/images/logo-dev.png'))],
    ));
  }
}
