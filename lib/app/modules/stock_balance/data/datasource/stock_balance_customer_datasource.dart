import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

abstract class StockBalanceCustomerDataSource extends Gateway {
  StockBalanceCustomerDataSource({required super.httpClient});

  Future<List<StockBalanceModel>> getlist();
}

class StockBalanceCustomerDataSourceImpl
    extends StockBalanceCustomerDataSource {
  List<StockBalanceModel> stockBalanceCustomer = [];

  StockBalanceCustomerDataSourceImpl({required super.httpClient});
  @override
  Future<List<StockBalanceModel>> getlist() async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final tbSalesmanId = await getUserId();
      final uri = Uri.parse(
          '${baseApiUrl}stockbalance/customer/getlist/$tbInstitutionId/$tbSalesmanId');

      final response = await httpClient.get(uri);

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
