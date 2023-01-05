import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';

abstract class CollaboratorRegisterDatasource extends Gateway {
  CollaboratorRegisterDatasource({required super.httpClient});

  Future<CollaboratorMainModel> get({required int id});
  Future<CollaboratorMainModel> post({required CollaboratorMainModel model});
  Future<String> delete({required int id});
  Future<List<CollaboratorModel>> getlist({required int tbInstitutionId});
}

class CollaboratorRegisterDatasourceImpl
    extends CollaboratorRegisterDatasource {
  List<StateModel> states = [];
  List<CityModel> citys = [];

  CollaboratorRegisterDatasourceImpl({required super.httpClient});
  @override
  Future<CollaboratorMainModel> get({required int id}) async {
    return await request(
      'collaborator/$id',
      (payload) {
        final data = json.decode(payload);
        return CollaboratorMainModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<CollaboratorMainModel> post({
    required CollaboratorMainModel model,
  }) async {
    final bodyEnvio = json.encode(model.toJson());

    return await request(
      'collaborator',
      data: bodyEnvio,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        return CollaboratorMainModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> delete({required int id}) async {
    return await request(
      'collaborator/$id',
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
  Future<List<CollaboratorModel>> getlist({
    required int tbInstitutionId,
  }) async {
    return await request(
      'collaborator/getlist/$tbInstitutionId',
      (payload) {
        final obj = json.decode(payload);
        List<CollaboratorModel> collaborators = (obj as List).map((json) {
          return CollaboratorModel.fromJson(json);
        }).toList();
        return collaborators;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
