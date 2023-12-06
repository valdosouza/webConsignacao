import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:flutter/foundation.dart';

abstract class OrderSaleRegisterDatasource extends Gateway {
  OrderSaleRegisterDatasource({required super.httpClient});

  Future<OrderSaleModel> post({required OrderSaleMainCardModel model});
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbPriceListId});

  Future<List<OrderSaleListModel>> getlist(
      {required ParamsOrderSaleList params});

  Future<OrderSaleMainCardModel> getOrderCard({required int tbOrderId});
}

class OrderSaleRegisterDatasourceImpl extends OrderSaleRegisterDatasource {
  OrderSaleRegisterDatasourceImpl({required super.httpClient});

  @override
  Future<OrderSaleModel> post({
    required OrderSaleMainCardModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });

    final tbSalesmanId = tbUserId;

    model.order.tbInstitutionId = tbInstitutionId;
    model.order.tbSalesmanId = tbSalesmanId;
    model.order.tbUserId = tbUserId;

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
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<OrderSaleCardModel>> getNewOrderSaleCard(
      {required int tbPriceListId}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

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
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<OrderSaleListModel>> getlist(
      {required ParamsOrderSaleList params}) async {
    try {
      await getInstitutionId().then((value) {
        params.tbInstitutionId = int.parse(value);
      });
      await getUserId().then((value) {
        params.tbSalesmanId = int.parse(value);
      });
      final body = jsonEncode(params.toJson());
      return request(
        'ordersale/getlist/',
        data: body,
        method: HTTPMethod.post,
        (payload) {
          final obj = json.decode(payload);
          List<OrderSaleListModel> orderSaleList = (obj as List).map((json) {
            return OrderSaleListModel.fromJson(json);
          }).toList();
          return orderSaleList;
        },
        onError: (error) {
          return Future.error(ServerException());
        },
      );
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderSaleMainCardModel> getOrderCard({required int tbOrderId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });
      return request(
        'ordersale/card/get/$tbInstitutionId/$tbOrderId',
        (payload) {
          final data = json.decode(payload);

          return OrderSaleMainCardModel.fromJson(data);
        },
        onError: (error) {
          return Future.error(ServerException());
        },
      );
    } catch (error) {
      throw ServerException();
    }
  }
}
