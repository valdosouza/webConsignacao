import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:http/http.dart' as http;

abstract class StockBalanceCustomerDataSource {
  Future<List<StockBalanceModel>> getlist(
      {required int id, required int salesmanId});
}

class StockBalanceCustomerDataSourceImpl
    extends StockBalanceCustomerDataSource {
  final client = http.Client();
  List<StockBalanceModel> stockBalanceCustomer = [];

  @override
  Future<List<StockBalanceModel>> getlist(
      {required int id, required int salesmanId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}stockbalance/customer/getlist/1/2');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        stockBalanceCustomer = (data as List).map((json) {
          return StockBalanceModel.fromJson(json);
        }).toList();

        return stockBalanceCustomer;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
