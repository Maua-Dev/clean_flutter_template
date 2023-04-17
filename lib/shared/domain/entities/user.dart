import '../../helpers/errors/domain_errors.dart';
import '../enums/state_enum.dart';

class User {
  final String? id;
  final String name;
  final String email;
  final String password;
  final StateEnum state;

  static const int minNameLenght = 2;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.state,
  }) {
    if (!User.validateName(name)) {
      throw EntityError(message: 'name');
    }
    if (!User.validateEmail(email)) {
      throw EntityError(message: 'email');
    }
    if (!User.validatePassword(password)) {
      throw EntityError(message: 'password');
    }
  }

  static bool validateName(String name) {
    if (name.length < User.minNameLenght) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    RegExp regex = RegExp(
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)",
    );
    return regex.hasMatch(email);
  }

  static bool validatePassword(String password) {
    if (password.length < 6) {
      return false;
    }
    return true;
  }
}
