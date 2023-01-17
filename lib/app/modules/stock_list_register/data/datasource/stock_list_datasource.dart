import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

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
  var tbInstitutionId = 1;

  StockListDatasourceImpl({required super.httpClient});
  @override
  Future<List<StockListModel>> getlist() async {
    try {
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
      model.tbInstitutionId = tbInstitutionId;
      final response = await httpClient.post(
        uri,
        body: model.toJson(),
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
      model.tbInstitutionId = tbInstitutionId;
      final uri = Uri.parse('${baseApiUrl}stockList');

      final response = await httpClient.put(uri, body: model.toJson());

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
