import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';

abstract class StockBalanceCustomerDataSource extends Gateway {
  StockBalanceCustomerDataSource({required super.httpClient});

  Future<StockBalanceModel> getlist();

  Future<StockBalanceByProductModel> customerAllByProducts(
      {required ParamsGetCustomerAllByProducts params});
}

class StockBalanceCustomerDataSourceImpl
    extends StockBalanceCustomerDataSource {
  StockBalanceCustomerDataSourceImpl({required super.httpClient});
  @override
  Future<StockBalanceModel> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final tbSalesmanId = await getUserId();
      final uri = Uri.parse(
          '${baseApiUrl}stockbalance/customer/getAll/$tbInstitutionId/$tbSalesmanId');

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
  Future<StockBalanceByProductModel> customerAllByProducts(
      {required ParamsGetCustomerAllByProducts params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });
    String tbSalesmanId = '0';
    await getUserId().then((value) {
      tbSalesmanId = value.toString();
    });

    return await request(
      'stockbalance/customer/getAllByProduct/$tbInstitutionId/$tbSalesmanId/${params.tbProductId}',
      method: HTTPMethod.get,
      (payload) {
        final data = json.decode(payload);
        final stockBalance = StockBalanceByProductModel.fromJson(data);

        return stockBalance;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
