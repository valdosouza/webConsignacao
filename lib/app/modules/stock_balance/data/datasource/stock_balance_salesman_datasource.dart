import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';

abstract class StockBalanceSalesmanDataSource extends Gateway {
  StockBalanceSalesmanDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist(
      {required ParamsGetlistStockBalanceModel params});
}

class StockBalanceSalesmanDataSourceImpl
    extends StockBalanceSalesmanDataSource {
  StockBalanceSalesmanDataSourceImpl({required super.httpClient});

  @override
  Future<StockBalanceModel> getlist(
      {required ParamsGetlistStockBalanceModel params}) async {
    params.tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      String idLocal = value.toString();
      params.tbInstitutionId = int.parse(idLocal);
    });
    if (params.tbSalesmanId == 0) {
      await getUserId().then((value) {
        params.tbSalesmanId = int.parse(value);
      });
    }
    final body = jsonEncode(params.toJson());
    return await request(
      'stockbalance/salesman/getlist/',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);

        final stockBalance = StockBalanceModel.fromJson(data);
        return stockBalance;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
