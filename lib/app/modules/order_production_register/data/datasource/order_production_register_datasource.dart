import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderProductionRegisterDataSource extends Gateway {
  OrderProductionRegisterDataSource({required super.httpClient});

  Future<List<OrderProductionRegisterModel>> getlist();
  Future<OrderProductionRegisterModel> get({required int orderProductionId});
  Future<OrderProductionRegisterModel> post(
      {required OrderProductionRegisterModel model});
  Future<OrderProductionRegisterModel> put(
      {required OrderProductionRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductListModel>> getListProducts();
  Future<List<StockListModel>> getListStock();
  Future<String> closure({required OrderStatusModel model});
  Future<String> reopen({required OrderStatusModel model});
}

class OrderProductionRegisterDataSourceImpl
    extends OrderProductionRegisterDataSource {
  List<OrderProductionRegisterModel> orderProduction = [];
  List<ProductListModel> products = [];
  List<StockListModel> stock = [];

  OrderProductionRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderProductionRegisterModel>> getlist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderproduction/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        orderProduction = (data as List).map(
          (json) {
            return OrderProductionRegisterModel.fromJson(json);
          },
        ).toList();
        return orderProduction;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderProductionRegisterModel> post({
    required OrderProductionRegisterModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });

    model.tbInstitutionId = tbInstitutionId;
    model.tbUserId = tbUserId;

    final body = jsonEncode(model.toJson());

    return request(
      'orderproduction',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);
        var model = OrderProductionRegisterModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderProductionRegisterModel> put({
    required OrderProductionRegisterModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });

    model.tbInstitutionId = tbInstitutionId;
    model.tbUserId = tbUserId;

    final body = jsonEncode(model.toJson());
    return request(
      'orderproduction',
      data: body,
      method: HTTPMethod.put,
      (payload) {
        final data = json.decode(payload);
        var model = OrderProductionRegisterModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> delete({
    required int id,
  }) async {
    return request(
      'orderproduction/$id',
      method: HTTPMethod.delete,
      (payload) {
        return "";
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderProductionRegisterModel> get(
      {required int orderProductionId}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderproduction/get/$tbInstitutionId/$orderProductionId',
      (payload) {
        final data = json.decode(payload);
        var model = OrderProductionRegisterModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<ProductListModel>> getListProducts() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'product/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        products = (data as List).map((json) {
          return ProductListModel.fromJson(json);
        }).toList();

        return products;
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
        stock = (data as List).map((json) {
          return StockListModel.fromJson(json);
        }).toList();

        return stock;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> closure({required OrderStatusModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    model.tbInstitutionId = tbInstitutionId;

    final body = jsonEncode(model.toJson());

    return request(
      'orderproduction/closure',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<String> reopen({required OrderStatusModel model}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    model.tbInstitutionId = tbInstitutionId;

    final body = jsonEncode(model.toJson());

    return request(
      'orderproduction/reopen',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
