import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:http/http.dart' as http;

abstract class InstitutionRegisterDatasource {
  Future<InstitutionModel> get({required int id});
  Future<InstitutionModel> post({required InstitutionModel model});
  Future<String> put({required InstitutionModel model});
  Future<String> delete({required int id});
}

class InstitutionRegisterDatasourceImpl
    implements InstitutionRegisterDatasource {
  final client = http.Client();
  @override
  Future<InstitutionModel> get({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}institution/$id');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return InstitutionModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<InstitutionModel> post({required InstitutionModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/');
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: model.toJson(),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return InstitutionModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required InstitutionModel model}) async {
    try {
      final int id = model.id;
      final uri = Uri.parse('${baseApiUrl}Institution/$id');
      final response = await client.put(uri, body: model.toJson());
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
  Future<String> delete({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/$id');
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
}
