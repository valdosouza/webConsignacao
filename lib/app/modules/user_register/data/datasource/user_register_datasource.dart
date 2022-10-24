import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRegisterDataSource {
  Future<List<UserRegisterModel>> getlist({required int id});
  Future<UserRegisterModel> addUser({required UserRegisterModel user});
  Future<String> deleteUser({required int id});
}

class UserRegisterDataSourceImpl extends UserRegisterDataSource {
  final client = http.Client();
  List<UserRegisterModel> items = [];

  @override
  Future<UserRegisterModel> addUser({required UserRegisterModel user}) async {
    final uri = Uri.parse('${baseApiUrl}user');
    try {
      final response = await client.post(uri, body: user.toJson());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UserRegisterModel result = UserRegisterModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> deleteUser({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}User/$id');

      final response = await client.delete(uri);

      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<UserRegisterModel>> getlist({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}user/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return UserRegisterModel.fromJson(json);
        }).toList();
        return items;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
