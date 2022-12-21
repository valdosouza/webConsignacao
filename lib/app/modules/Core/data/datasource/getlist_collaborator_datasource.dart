import 'dart:convert';
import 'package:appweb/app/modules/Core/data/model/collaborator_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:http/http.dart' as http;

abstract class GetlistCollaboratorDatasource {
  Future<List<CollaboratorModel>> getlistCollaborator(
      {required int institution});
}

class GetlistCollaboratorDatasourceImpl
    implements GetlistCollaboratorDatasource {
  final client = http.Client();
  List<CollaboratorModel> list = [];

  @override
  Future<List<CollaboratorModel>> getlistCollaborator(
      {required int institution}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator/getlist/$institution');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        list = (data as List).map((json) {
          return CollaboratorModel.fromJson(json);
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
