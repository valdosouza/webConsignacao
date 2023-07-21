import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:flutter/foundation.dart';

abstract class CollaboratorRegisterDatasource extends Gateway {
  CollaboratorRegisterDatasource({required super.httpClient});

  Future<CollaboratorMainModel> get({required int id});
  Future<CollaboratorListModel> post({required CollaboratorMainModel model});
  Future<String> delete({required int id});
  Future<List<CollaboratorListModel>> getlist();
}

class CollaboratorRegisterDatasourceImpl
    extends CollaboratorRegisterDatasource {
  List<StateModel> states = [];
  List<CityModel> citys = [];

  CollaboratorRegisterDatasourceImpl({required super.httpClient});
  @override
  Future<CollaboratorMainModel> get({required int id}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'collaborator/$tbInstitutionId/$id',
      (payload) {
        final data = json.decode(payload);
        return CollaboratorMainModel.fromJson(data);
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<CollaboratorListModel> post({
    required CollaboratorMainModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    model.collaborator.tbInstitutionId = tbInstitutionId;
    final bodyEnvio = json.encode(model.toJson());

    return await request(
      'collaborator',
      data: bodyEnvio,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        return CollaboratorListModel.fromJson(data);
      },
      onError: (error) {
        return Future.error(ServerException());
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
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<CollaboratorListModel>> getlist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'collaborator/getlist/$tbInstitutionId',
      (payload) {
        final obj = json.decode(payload);
        List<CollaboratorListModel> collaborators = (obj as List).map((json) {
          return CollaboratorListModel.fromJson(json);
        }).toList();
        return collaborators;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
