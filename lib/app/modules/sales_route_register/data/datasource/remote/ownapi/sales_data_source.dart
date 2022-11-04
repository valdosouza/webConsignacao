import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';

import '../../../../../../core/shared/constants.dart';
import '../../../models/sales_model.dart';
import 'package:http/http.dart' as http;

abstract class SalesDataSource {
  Future<SalesModel> post({required SalesModel model});
  Future<List<SalesModel>> getlist({required int institutionId});
  Future<String> put({required SalesModel model});
  Future<String> delete({required int id});
}

class SalesDataSourceImpl implements SalesDataSource {
  final client = http.Client();
  List<SalesModel> items = [];

  @override
  Future<List<SalesModel>> getlist({required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$institutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return SalesModel.fromJson(json);
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
  Future<SalesModel> post({required SalesModel model}) async {
    final uri = Uri.parse('${baseApiUrl}salesroute');
    try {
      final response = await client.post(uri, body: model.toJson());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        SalesModel result = SalesModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required SalesModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute');

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
      final uri = Uri.parse('${baseApiUrl}salesroute/$id');

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
