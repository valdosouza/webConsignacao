import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:http/http.dart' as http;

/// Throws a [ServerException] for all error codes.
abstract class LineBusinessDatasource {
  Future<List<LineBusinessModel>> getlist({required int institutionId});
  Future<LineBusinessModel> post({required LineBusinessModel model});
  Future<String> put({required LineBusinessModel model});
  Future<String> delete({required int id});
}

class LineBusinessDatasourceImpl implements LineBusinessDatasource {
  final client = http.Client();
  List<LineBusinessModel> items = [];
  @override
  Future<List<LineBusinessModel>> getlist({required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}linebusiness/getlist/$institutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return LineBusinessModel.fromJson(json);
        }).toList();
        return items;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LineBusinessModel> post({required LineBusinessModel model}) async {
    final uri = Uri.parse('${baseApiUrl}linebusiness');
    try {
      final response = await client.post(uri, body: model.toJson());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        LineBusinessModel result = LineBusinessModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required LineBusinessModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}linebusiness');

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
      final uri = Uri.parse('${baseApiUrl}linebusiness/$id');

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
