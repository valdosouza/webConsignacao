import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';

abstract class InstitutionRegisterDatasource extends Gateway {
  InstitutionRegisterDatasource({required super.httpClient});

  Future<InstitutionModel> get({required int id});
  Future<InstitutionModel> post({required InstitutionModel model});
  Future<String> put({required InstitutionModel model});
  Future<String> delete({required int id});
}

class InstitutionRegisterDatasourceImpl extends InstitutionRegisterDatasource {
  InstitutionRegisterDatasourceImpl({required super.httpClient});
  @override
  Future<InstitutionModel> get({required int id}) async {
    return request(
      'institution/$id',
      (payload) {
        final data = json.decode(payload);
        return InstitutionModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<InstitutionModel> post({required InstitutionModel model}) async {
    return request(
      'Institution/',
      method: HTTPMethod.post,
      data: jsonEncode(model.toJson()),
      (payload) {
        final data = json.decode(payload);
        return InstitutionModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> put({required InstitutionModel model}) async {
    final int id = model.id;

    return request(
      'Institution/$id',
      method: HTTPMethod.put,
      data: jsonEncode(model.toJson()),
      (payload) {
        return '';
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> delete({required int id}) async {
    return request(
      'Institution/$id',
      method: HTTPMethod.delete,
      (payload) {
        return '';
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
