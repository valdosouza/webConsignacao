import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:http/http.dart' as http;

abstract class PriceListRegisterDataSource {
  Future<List<PriceListModel>> getlist();
  Future<PriceListModel> post({required PriceListModel model});
  Future<PriceListModel> put({required PriceListModel model});
  Future<String> delete({required int id});
}

class PriceListRegisterDataSourceImpl extends PriceListRegisterDataSource {
  final client = http.Client();
  List<PriceListModel> prices = [];
  var tbInstitutionId = 1;
  @override
  Future<List<PriceListModel>> getlist() async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist/getlist/$tbInstitutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return PriceListModel.fromJson(json);
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
  Future<PriceListModel> post({required PriceListModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PriceListModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PriceListModel> put({required PriceListModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PriceListModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}pricelist/$id');

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
