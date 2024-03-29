import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:flutter/foundation.dart';

abstract class PriceListRegisterDataSource extends Gateway {
  PriceListRegisterDataSource({required super.httpClient});

  Future<List<PriceListModel>> getlist();
  Future<PriceListModel> post({required PriceListModel model});
  Future<PriceListModel> put({required PriceListModel model});
  Future<String> delete({required int id});
}

class PriceListRegisterDataSourceImpl extends PriceListRegisterDataSource {
  List<PriceListModel> prices = [];

  PriceListRegisterDataSourceImpl({required super.httpClient});
  @override
  Future<List<PriceListModel>> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}pricelist/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

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
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;
      final bodyContent = jsonEncode(model.toJson());
      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await httpClient.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyContent,
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
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;

      final uri = Uri.parse('${baseApiUrl}pricelist');

      final response = await httpClient.put(
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
