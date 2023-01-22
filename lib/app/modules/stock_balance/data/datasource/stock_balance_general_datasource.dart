import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceGeneralDataSource extends Gateway {
  StockBalanceGeneralDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist();
}

class StockBalanceGeneralDataSourceImpl extends StockBalanceGeneralDataSource {
  StockBalanceGeneralDataSourceImpl({required super.httpClient});
  @override
  Future<StockBalanceModel> getlist() async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final uri = Uri.parse(
          '${baseApiUrl}stockbalance/salesman/getall/$tbInstitutionId/tbSalesmanId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final stockBalance = StockBalanceModel.fromJson(data);

        return stockBalance;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
