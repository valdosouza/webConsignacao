import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_model.dart';

abstract class OrderSaleRegisterDatasource extends Gateway {
  OrderSaleRegisterDatasource({required super.httpClient});

  Future<OrderSaleModel> post({required OrderSaleMainCardModel model});
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbPriceListId});
}

class OrderSaleRegisterDatasourceImpl extends OrderSaleRegisterDatasource {
  OrderSaleRegisterDatasourceImpl({required super.httpClient});

  @override
  Future<OrderSaleModel> post({
    required OrderSaleMainCardModel model,
  }) async {
    var tbInstitutionId = getInstitutionId();
    var tbSalesmanId = getUserId();
    var tbUserId = getUserId();
    model.order.tbInstitutionId = tbInstitutionId as int;
    model.order.tbSalesmanId = tbSalesmanId as int;
    model.order.tbUserId = tbUserId as int;

    final bodyEnvio = json.encode(model.toJson());

    return await request(
      'ordersale/card',
      data: bodyEnvio,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        return OrderSaleModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbPriceListId}) async {
    var tbInstitutionId = getInstitutionId();

    return request(
      'ordersale/card/newlist/$tbInstitutionId/$tbPriceListId',
      (payload) {
        final obj = json.decode(payload);
        List<OrderSaleCardModel> orderSaleCard = (obj as List).map((json) {
          return OrderSaleCardModel.fromJson(json);
        }).toList();
        return orderSaleCard;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
