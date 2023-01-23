import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceSalesmanDataSource extends Gateway {
  StockBalanceSalesmanDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist();
}

class StockBalanceSalesmanDataSourceImpl
    extends StockBalanceSalesmanDataSource {
  StockBalanceSalesmanDataSourceImpl({required super.httpClient});
  @override
  Future<StockBalanceModel> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });
      String tbSalesmanId = '1';
      await getInstitutionId().then((value) {
        tbSalesmanId = value as String;
      });
      final uri = Uri.parse(
          '$baseApiUrl/stockbalance/salesman/getlist/$tbInstitutionId/$tbSalesmanId');

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
