import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
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
  @override
  Future<AuthModel> getAuthentication(
      {required String username, required String password}) async {
    return await request(
      'auth/authenticate/',
      method: HTTPMethod.post,
      data: jsonEncode(
        <String, String>{
          'email': username,
          'password': password.toUpperCase(),
        },
      ),
      (payload) {
        final jsonMap = json.decode(payload) as Map<String, dynamic>;
        return AuthModel.fromJson(jsonMap);
      },
      onError: (error) {
        return AuthModel(
            auth: false,
            id: 0,
            jwt: "",
            password: "",
            tbInstitutionId: 0,
            username: username,
            error: error.toString());
      },
    );
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
