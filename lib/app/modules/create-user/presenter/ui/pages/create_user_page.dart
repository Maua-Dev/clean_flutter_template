import 'package:clean_flutter_template/app/modules/create-user/presenter/controller/create_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          controller.createUser();
        },
        child: const Text('Create User'),
      ),
    ));
  }
}
