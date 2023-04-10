import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';

abstract class StockBalanceDataSource extends Gateway {
  StockBalanceDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist(
      {required ParamsGetlistStockBalanceModel params});
  Future<List<StockListModel>> getListStock();
}

class StockBalanceDataSourceImpl extends StockBalanceDataSource {
  StockBalanceDataSourceImpl({required super.httpClient});
  @override
  Future<StockBalanceModel> getlist(
      {required ParamsGetlistStockBalanceModel params}) async {
    params.tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      params.tbInstitutionId = int.parse(value.toString());
    });

    final body = jsonEncode(params.toJson());
    return await request(
      'stockbalance/getlist/',
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

  @override
  Future<List<StockListModel>> getListStock() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'stocklist/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        final stock = (data as List).map((json) {
          return StockListModel.fromJson(json);
        }).toList();

        return stock;
      },
      onError: (error) {
        throw ServerException;
      },
    );
  }
}
