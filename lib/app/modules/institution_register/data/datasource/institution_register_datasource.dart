import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:http/http.dart' as http;

abstract class InstitutionRegisterDatasource {
  Future<InstitutionModel> getInstitution({required int id});
  Future<InstitutionModel> postInstitution({required InstitutionModel model});
  Future<String> putInstitution({required InstitutionModel model});
  Future<String> deleteInstitution({required int id});
}

class InstitutionRegisterDatasourceImpl
    implements InstitutionRegisterDatasource {
  final client = http.Client();

  @override
  Future<InstitutionModel> getInstitution({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/$id');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return InstitutionModel.fromJson(data[0]);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<InstitutionModel> postInstitution(
      {required InstitutionModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/');
      final response = await client.post(uri, body: model.toJson());
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
  Future<String> putInstitution({required InstitutionModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution//${model.id}');
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
  Future<String> deleteInstitution({required int id}) async {
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
