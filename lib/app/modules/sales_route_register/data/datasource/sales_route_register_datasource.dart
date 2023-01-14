import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:http/http.dart' as http;

abstract class SalesRouteRegisterDataSource {
  Future<List<SalesRouteRegisterModel>> getlist();
  Future<SalesRouteRegisterModel> post(
      {required SalesRouteRegisterModel model});
  Future<SalesRouteRegisterModel> put({required SalesRouteRegisterModel model});
  Future<String> delete({required int id});
}

class SalesRouteRegisterDataSourceImpl extends SalesRouteRegisterDataSource {
  final client = http.Client();
  List<SalesRouteRegisterModel> prices = [];
  var tbInstitutionId = 1;
  @override
  Future<List<SalesRouteRegisterModel>> getlist() async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$tbInstitutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return SalesRouteRegisterModel.fromJson(json);
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
  Future<SalesRouteRegisterModel> post(
      {required SalesRouteRegisterModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = SalesRouteRegisterModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<SalesRouteRegisterModel> put(
      {required SalesRouteRegisterModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        var model = SalesRouteRegisterModel.fromJson(data);
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
