import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
        image: AssetImage('assets/images/logo-dev.png'), fit: BoxFit.fill);
  }
}
