import 'dart:convert';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';

abstract class GetlistCollaboratorDatasource extends Gateway {
  GetlistCollaboratorDatasource({required super.httpClient});

  Future<List<CollaboratorListModel>> getlistCollaborator();
}

class GetlistCollaboratorDatasourceImpl extends GetlistCollaboratorDatasource {
  List<CollaboratorListModel> list = [];

  GetlistCollaboratorDatasourceImpl({required super.httpClient});

  @override
  Future<List<CollaboratorListModel>> getlistCollaborator() async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final uri =
          Uri.parse('${baseApiUrl}collaborator/getlist/$tbInstitutionId');
      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        list = (data as List).map((json) {
          return CollaboratorListModel.fromJson(json);
        }).toList();

        return list;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
