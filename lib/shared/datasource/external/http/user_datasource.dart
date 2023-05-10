import 'package:clean_flutter_template/shared/infra/external/http/user_datasource_interface.dart';
import 'package:clean_flutter_template/shared/infra/models/user_model.dart';
import '../../../helpers/services/http_request_interface.dart';

class UserDatasource implements IUserDatasource {
  final IHttpRequest _httpRequest;

  UserDatasource(this._httpRequest);

  @override
  Future<UserModel> deleteUser(String userId) async {
    var response = await _httpRequest.post(
      '/delete-user',
      {
        'user_id': userId,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> getUser(String userId) async {
    var response = await _httpRequest.get(
      '/get-user',
      {
        'user_id': userId,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> updateUser(UserModel userToUpdate) async {
    var response = await _httpRequest.post(
      '/update-user',
      userToUpdate.toJsonUpdate(),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> createUser(UserModel userToCreate) async {
    var response = await _httpRequest.post(
      '/create-user',
      userToCreate.toJsonCreate(),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
