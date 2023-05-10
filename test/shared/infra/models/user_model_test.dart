import 'dart:ui';

import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:clean_flutter_template/shared/domain/enums/state_enum.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var userModel = UserModel(
    name: 'Gabriel',
    email: 'gabriel.godoybz@hotmail.com',
    state: StateEnum.APPROVED,
    id: 123,
  );

  var userMap = {
    'user_id': 123,
    'name': 'Gabriel',
    'email': 'gabriel.godoybz@hotmail.com',
    'state': 'APPROVED',
  };

  var userMapUpdate = {
    'user_id': '123',
    'new_name': 'Gabriel',
  };

  var userMapCreate = {
    'name': 'Gabriel',
    'email': 'gabriel.godoybz@hotmail.com',
  };

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test('[TEST] - userModel toJsonCreate', () {
    expect(userModel.toJsonCreate(), userMapCreate);
  });

  test('[TEST] - userModel toJsonUpdate', () {
    expect(userModel.toJsonUpdate(), userMapUpdate);
  });

  test('[TEST] - userModel fromJson', () {
    expect(UserModel.fromJson(userMap).id, userModel.id);
    expect(UserModel.fromJson(userMap).name, userModel.name);
    expect(UserModel.fromJson(userMap).email, userModel.email);
    expect(UserModel.fromJson(userMap).state, userModel.state);
  });

  test('[TEST] - userModel fromMaps', () {
    var userList = [userMap, userMap];
    expect(UserModel.fromMaps(userList).length, 2);
  });
}
