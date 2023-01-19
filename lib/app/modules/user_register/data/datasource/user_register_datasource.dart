import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/user_register/data/model/user_register_model.dart';

abstract class UserRegisterDataSource extends Gateway {
  UserRegisterDataSource({required super.httpClient});

  Future<List<UserRegisterModel>> getlist();
  Future<UserRegisterModel> post({required UserRegisterModel model});
  Future<UserRegisterModel> put({required UserRegisterModel model});
  Future<String> delete({required int id});
}

class UserRegisterDataSourceImpl extends UserRegisterDataSource {
  List<UserRegisterModel> items = [];

  UserRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<UserRegisterModel> post({required UserRegisterModel model}) async {
    final tbInstitutionId = await getInstitutionId();
    model.tbInstitutionId = tbInstitutionId;

    final bodyEnvio = json.encode(model.toJson());
    return await request(
      'user',
      data: bodyEnvio,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        return UserRegisterModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> delete({required int id}) async {
    return await request(
      'user/$id',
      method: HTTPMethod.delete,
      (payload) {
        return "";
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<UserRegisterModel> put({required UserRegisterModel model}) async {
    final tbInstitutionId = await getInstitutionId();
    model.tbInstitutionId = tbInstitutionId;
    final bodyEnvio = json.encode(model.toJson());
    return await request(
      'user',
      data: bodyEnvio,
      method: HTTPMethod.put,
      (payload) {
        final data = json.decode(payload);
        return UserRegisterModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<UserRegisterModel>> getlist() async {
    final tbInstitutionId = await getInstitutionId();
    return await request(
      'user/getlist/$tbInstitutionId',
      (payload) {
        final obj = json.decode(payload);
        List<UserRegisterModel> result = (obj as List).map((json) {
          return UserRegisterModel.fromJson(json);
        }).toList();
        return result;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
