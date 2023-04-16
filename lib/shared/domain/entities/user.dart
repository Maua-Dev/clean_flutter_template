import '../enums/state_enum.dart';

class User {
  final String? id;
  final String name;
  final String email;
  final String password;
  final StateEnum state;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.state,
  });
}
