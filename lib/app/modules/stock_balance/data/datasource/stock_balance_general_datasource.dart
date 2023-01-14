import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:http/http.dart' as http;

abstract class StockBalanceGeneralDataSource {
  Future<List<StockBalanceModel>> getlist();
}

class StockBalanceGeneralDataSourceImpl extends StockBalanceGeneralDataSource {
  final client = http.Client();
  List<StockBalanceModel> stockBalanceGeneral = [];
  var tbInstitutionId = 1;
  var tbSalesmanId = 2;
  @override
  Future<List<StockBalanceModel>> getlist() async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}stockbalance/salesman/getall/$tbInstitutionId/tbSalesmanId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        stockBalanceGeneral = (data as List).map((json) {
          return StockBalanceModel.fromJson(json);
        }).toList();

        return stockBalanceGeneral;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
