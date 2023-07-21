import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:flutter/foundation.dart';

/// Throws a [ServerException] for all error codes.
abstract class StockListDatasource extends Gateway {
  StockListDatasource({required super.httpClient});

  Future<List<StockListModel>> getlist();
  Future<StockListModel> post({required StockListModel model});
  Future<String> put({required StockListModel model});
  Future<String> delete({required int id});
}

class StockListDatasourceImpl extends StockListDatasource {
  List<StockListModel> items = [];

  StockListDatasourceImpl({required super.httpClient});
  @override
  Future<List<StockListModel>> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}stocklist/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return StockListModel.fromJson(json);
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
  Future<StockListModel> post({required StockListModel model}) async {
    final uri = Uri.parse('${baseApiUrl}stockList');
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;
      final bodyContent = jsonEncode(model.toJson());
      final response = await httpClient.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyContent,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        StockListModel result = StockListModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required StockListModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;
      final bodyContent = jsonEncode(model.toJson());
      final uri = Uri.parse('${baseApiUrl}stockList');

      final response = await httpClient.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyContent,
      );

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
      final uri = Uri.parse('${baseApiUrl}StockList/$id');

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
