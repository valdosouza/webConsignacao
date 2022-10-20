import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:http/http.dart' as http;

/// Throws a [ServerException] for all error codes.
abstract class StockListDatasource {
  Future<List<StockListModel>> getlist({required int institutionId});
}

class StockListDatasourceImpl implements StockListDatasource {
  final client = http.Client();
  List<StockListModel> items = [];
  @override
  Future<List<StockListModel>> getlist({required int institutionId}) async {
    final uri = Uri.parse('${baseApiUrl}stocklist/getlist/$institutionId');

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      items = (data as List).map((json) {
        return StockListModel.fromJson(json);
      }).toList();
      return items;
    } else {
      throw ServerException();
    }
  }
}
