import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';

abstract class OrderSaleRegisterDatasource extends Gateway {
  OrderSaleRegisterDatasource({required super.httpClient});

  Future<OrderSaleMainCardModel> post({required OrderSaleMainCardModel model});
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbInstitutionId, required int tbPriceListId});
}

class OrderSaleRegisterDatasourceImpl extends OrderSaleRegisterDatasource {
  OrderSaleRegisterDatasourceImpl({required super.httpClient});

  @override
  Future<OrderSaleMainCardModel> post(
      {required OrderSaleMainCardModel model}) async {
    var body = jsonEncode(model.toJson());
    return await request(
      '/ordersale',
      data: body,
      method: HTTPMethod.post,
      (payload) {
        return payload;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbInstitutionId, required int tbPriceListId}) async {
    return request(
      '/ordersale/card/newlist/$tbInstitutionId/$tbPriceListId',
      (payload) {
        final obj = json.decode(payload);
        List<OrderSaleCardModel> itemsPreSale = (obj as List).map((json) {
          return OrderSaleCardModel.fromJson(json);
        }).toList();
        return itemsPreSale;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
