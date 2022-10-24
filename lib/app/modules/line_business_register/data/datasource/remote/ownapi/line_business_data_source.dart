import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:http/http.dart' as http;

abstract class LineBusinessDataSource {
   Future<List<LineBusinessModel>> getlist({required String idInstitution});
  Future<String> postLineBusiness(
      {required LineBusinessModel lineBusinessModel});
  Future<String> deleteLineBusiness({required int lineBusinessId});
  Future<String> putLineBusiness({required LineBusinessModel lineBusinessModel});
}

class LineBusinessDataSourceImpl extends LineBusinessDataSource{
  final client = http.Client();
  List<LineBusinessModel> items = [];

  @override
  Future<String> deleteLineBusiness({required int lineBusinessId}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$lineBusinessId');

    try {
      final response = await client.delete(uri);

      if (response.statusCode == 200) {      
        return '';
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<LineBusinessModel>> getlist({required String idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$idInstitution');

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return LineBusinessModel.fromJson(json);
        }).toList();
        return items;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> postLineBusiness({required LineBusinessModel lineBusinessModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');
    final body = {
      "tb_institution_id": lineBusinessModel.idInstitution.toString(),
      "description": lineBusinessModel.description.toUpperCase(),
      "active": lineBusinessModel.active ? 'S' : 'N'
    };

    try {
      final response = await client.post(uri, body: body);

      if (response.statusCode == 200) {
        return '';
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> putLineBusiness({required LineBusinessModel lineBusinessModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');

    try {
      final response = await client.put(uri, body: lineBusinessModel.toMap());

      if (response.statusCode == 200) {
        return "";
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

}