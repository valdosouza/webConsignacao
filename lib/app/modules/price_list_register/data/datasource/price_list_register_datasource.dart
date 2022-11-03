import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:http/http.dart' as http;

abstract class PriceListRegisterDataSource {
  Future<List<PriceListRegisterModel>> getlist({required int id});
  Future<PriceListRegisterModel> post(
      {required PriceListRegisterModel priceModel});
  Future<PriceListRegisterModel> put(
      {required PriceListRegisterModel priceModel});
  Future<String> delete({required int id});
}

class PriceListRegisterDataSourceImpl extends PriceListRegisterDataSource {
  final client = http.Client();
  List<PriceListRegisterModel> prices = [];

  @override
  Future<List<PriceListRegisterModel>> getlist({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return PriceListRegisterModel.fromJson(json);
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
  Future<PriceListRegisterModel> post(
      {required PriceListRegisterModel priceModel}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(priceModel.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PriceListRegisterModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PriceListRegisterModel> put(
      {required PriceListRegisterModel priceModel}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(priceModel.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PriceListRegisterModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
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
