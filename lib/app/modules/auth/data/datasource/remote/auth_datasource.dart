import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/auth/data/model/auth_change_password_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_model.dart';
import 'package:appweb/app/modules/auth/data/model/auth_recovery_password_model.dart';

/// Calls the http://api.industriadechocolatesamor.com.br/auth/authenticate/ endpoint.
///
/// Throws a [ServerException] for all error codes.
abstract class AuthDatasource extends Gateway {
  AuthDatasource({required super.httpClient});

  Future<AuthModel> getAuthentication(
      {required String username, required String password});
  Future<String> changePassword({required AuthChangePasswordModel model});
  Future<AuthRecoveryPasswordModel> recoveryPassword({required String email});
}

class AuthDatasourceImpl extends AuthDatasource {
  AuthDatasourceImpl({required super.httpClient});
  @override
  Future<AuthModel> getAuthentication(
      {required String username, required String password}) async {
    final uri = Uri.parse('${baseApiUrl}auth/authenticate/');

    final response = await httpClient.post(
      uri,
      body: jsonEncode(
        <String, String>{
          'email': username,
          'password': password, //.toUpperCase(),
        },
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body) as Map<String, dynamic>;
      return AuthModel.fromJson(jsonMap);
    } else {
      return Future.error(ServerException());
    }
  }

  @override
  Future<String> changePassword({
    required AuthChangePasswordModel model,
  }) async {
    final body = jsonEncode(model.toJson());
    return await request(
      '/auth/changepassword',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        return payload;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<AuthRecoveryPasswordModel> recoveryPassword({
    required String email,
  }) async {
    final body = jsonEncode({
      'email': email,
    });
    return await request(
      'auth/recoverypassword',
      data: body,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        AuthRecoveryPasswordModel result =
            AuthRecoveryPasswordModel.fromJson(data);
        return result;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
