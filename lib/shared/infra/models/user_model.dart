import '../../domain/entities/user.dart';
import '../../domain/enums/state_enum.dart';

class UserModel extends User {
  UserModel(
      {required super.name,
      required super.email,
      required super.password,
      required super.state,
      super.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        state: StateEnum.values
            .firstWhere((element) => element.name == json['state']));
  }

  static List<UserModel> fromMaps(List array) {
    return array.map((e) => UserModel.fromJson(e)).toList();
  }

  toJson() {
    return {
      'name': super.name,
      'email': super.email,
      'password': super.password,
      'state': super.state.name
    };
  }
}
