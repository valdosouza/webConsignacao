import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';

abstract class SalesRouteRegisterDataSource extends Gateway {
  SalesRouteRegisterDataSource({required super.httpClient});

  Future<List<SalesRouteRegisterModel>> getlist();
  Future<SalesRouteRegisterModel> post(
      {required SalesRouteRegisterModel model});
  Future<SalesRouteRegisterModel> put({required SalesRouteRegisterModel model});
  Future<String> delete({required int id});
}

class SalesRouteRegisterDataSourceImpl extends SalesRouteRegisterDataSource {
  List<SalesRouteRegisterModel> prices = [];

  SalesRouteRegisterDataSourceImpl({required super.httpClient});
  @override
  Future<List<SalesRouteRegisterModel>> getlist() async {
    try {
      var tbInstitutionId = getInstitutionId();
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

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
      var tbInstitutionId = getInstitutionId();
      model.tbInstitutionId = tbInstitutionId as int;

      final uri = Uri.parse('${baseApiUrl}salesroute');

      final response = await httpClient.post(
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
      var tbInstitutionId = getInstitutionId();
      model.tbInstitutionId = tbInstitutionId as int;
      final uri = Uri.parse('${baseApiUrl}salesroute');

      final response = await httpClient.put(
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

      final response = await httpClient.delete(uri);

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
