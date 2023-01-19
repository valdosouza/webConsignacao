import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

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
}

class OrderProductionRegisterDataSourceImpl
    extends OrderProductionRegisterDataSource {
  List<OrderProductionRegisterModel> orderProduction = [];
  List<ProductListModel> products = [];
  List<StockListModel> stock = [];

  OrderProductionRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderProductionRegisterModel>> getlist() async {
    final tbInstitutionId = await getInstitutionId();

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
    final tbInstitutionId = await getInstitutionId();
    final tbUserId = await getUserId();

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
    final tbInstitutionId = await getInstitutionId();
    final tbUserId = await getUserId();

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
    final tbInstitutionId = await getInstitutionId();

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
    final tbInstitutionId = await getInstitutionId();
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
    final tbInstitutionId = await getInstitutionId();
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
}
