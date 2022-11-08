import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';

import 'package:http/http.dart' as http;

abstract class CollaboratorRegisterDatasource {
  Future<CollaboratorMainModel> get({required int id});
  Future<CollaboratorMainModel> post({required CollaboratorMainModel model});
  Future<String> delete({required int id});
  Future<List<CollaboratorListModel>> getlist({required int tbInstitutionId});
}

class CollaboratorRegisterDatasourceImpl
    implements CollaboratorRegisterDatasource {
  final client = http.Client();
  List<StateModel> states = [];
  List<CityModel> citys = [];
  @override
  Future<CollaboratorMainModel> get({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator/$id');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CollaboratorMainModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CollaboratorMainModel> post(
      {required CollaboratorMainModel model}) async {
    final uri = Uri.parse('${baseApiUrl}collaborator');
    try {
      final bodyEnvio = json.encode(model.toJson());

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(model.toJson()),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CollaboratorMainModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}Collaborator/$id');
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
  Future<List<CollaboratorListModel>> getlist(
      {required int tbInstitutionId}) async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}collaborator/getlist/$tbInstitutionId');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final obj = json.decode(response.body);
        List<CollaboratorListModel> collaborators = (obj as List).map((json) {
          return CollaboratorListModel.fromJson(json);
        }).toList();
        return collaborators;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
