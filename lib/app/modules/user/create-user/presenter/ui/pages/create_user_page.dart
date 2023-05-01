import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    // var controller = Modular.get<CreateUserController>();
    return Scaffold(
        body: Column(
      children: const [LogoWidget()],
    ));
  }
}
