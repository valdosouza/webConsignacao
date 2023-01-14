import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:http/http.dart' as http;

abstract class LinebusinessRegisterDataSource {
  Future<List<LinebusinessModel>> getlist();
  Future<LinebusinessModel> post({required LinebusinessModel model});
  Future<LinebusinessModel> put({required LinebusinessModel model});
  Future<String> delete({required int id});
}

class LinebusinessRegisterDataSourceImpl
    extends LinebusinessRegisterDataSource {
  final client = http.Client();
  List<LinebusinessModel> prices = [];
  var tbInstitutionId = 1;
  @override
  Future<List<LinebusinessModel>> getlist() async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}linebusiness/getlist/tbInstitutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return LinebusinessModel.fromJson(json);
        }).toList();

        return prices;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LinebusinessModel> post({required LinebusinessModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}linebusiness');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = LinebusinessModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LinebusinessModel> put({required LinebusinessModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}linebusiness');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = LinebusinessModel.fromJson(data);
        return model;
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
