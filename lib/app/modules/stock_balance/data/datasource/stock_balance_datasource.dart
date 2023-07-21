import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class StockBalanceDataSource extends Gateway {
  StockBalanceDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist({required int tbStockListId});
  Future<List<StockListModel>> getListStock();
}

class StockBalanceDataSourceImpl extends StockBalanceDataSource {
  StockBalanceDataSourceImpl({required super.httpClient});
  @override
  Future<StockBalanceModel> getlist({required int tbStockListId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}stockbalance/getlist/$tbInstitutionId/$tbStockListId');

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
