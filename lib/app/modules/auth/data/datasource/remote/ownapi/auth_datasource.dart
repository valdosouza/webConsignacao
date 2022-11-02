import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';
import 'package:http/http.dart' as http;

/// Calls the https://www.api.gestaosetes.com.br/user/authenticate/ endpoint.
///
/// Throws a [ServerException] for all error codes.
abstract class AuthDatasource {
  Future<AuthModel> getAuthentication(
      {required String username, required String password});
  Future<String> changePassword({required AuthChangePasswordModel model});
  Future<AuthRecoveryPasswordModel> recoveryPassword({required String email});
}

class AuthDatasourceImpl implements AuthDatasource {
  final _baseUrl = baseApiUrl;
  final client = http.Client();
  @override
  Future<AuthModel> getAuthentication(
      {required String username, required String password}) async {
    final uri = Uri.parse('${_baseUrl}user/authenticate/');
    final response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'email': username,
          'password': password.toUpperCase(),
        },
      ),
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      return AuthModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> changePassword(
      {required AuthChangePasswordModel model}) async {
    try {
      final uri = Uri.parse('${_baseUrl}user/changepassword');
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<AuthRecoveryPasswordModel> recoveryPassword(
      {required String email}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}user/recoverypassword');
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          'email': email,
        },
      );
      response.body;
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        AuthRecoveryPasswordModel result =
            AuthRecoveryPasswordModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
