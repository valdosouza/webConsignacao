import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:http/http.dart' as http;

abstract class StockBalanceSalesmanDataSource {
  Future<List<StockBalanceModel>> getlist({required int id, required int salesmanId});
}

class StockBalanceSalesmanDataSourceImpl
    extends StockBalanceSalesmanDataSource {
  final client = http.Client();
  List<StockBalanceModel> stockBalanceSalesman = [];

  @override
  Future<List<StockBalanceModel>> getlist({required int id, required int salesmanId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}stockbalnce/getlist/salesman/$id/1');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        stockBalanceSalesman = (data as List).map((json) {
          return StockBalanceModel.fromJson(json);
        }).toList();

        return stockBalanceSalesman;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
