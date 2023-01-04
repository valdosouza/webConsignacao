import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderProductionRegisterDataSource extends Gateway {
  OrderProductionRegisterDataSource({required super.httpClient});

  Future<List<OrderProductionRegisterModel>> getlist({required int id});
  Future<OrderProductionRegisterModel> get(
      {required int institutionId, required int orderProductionId});
  Future<OrderProductionRegisterModel> post(
      {required OrderProductionRegisterModel model});
  Future<OrderProductionRegisterModel> put(
      {required OrderProductionRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductModel>> getListProducts({required int institutionId});
  Future<List<StockListModel>> getListStock({required int institutionId});
}

class OrderProductionRegisterDataSourceImpl
    extends OrderProductionRegisterDataSource {
  final client = http.Client();
  List<OrderProductionRegisterModel> orderProduction = [];
  List<ProductModel> products = [];
  List<StockListModel> stock = [];

  OrderProductionRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderProductionRegisterModel>> getlist({
    required int id,
  }) async {
    return request(
      'orderproduction/getlist/$id',
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
    return request(
      'orderproduction',
      data: jsonEncode(model.toJson()),
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
  Future<OrderProductionRegisterModel> get({
    required int institutionId,
    required int orderProductionId,
  }) async {
    return request(
      'orderproduction/get/$institutionId/$orderProductionId',
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
  Future<List<ProductModel>> getListProducts(
      {required int institutionId}) async {
    return request(
      'product/getlist/$institutionId',
      (payload) {
        final data = json.decode(payload);
        products = (data as List).map((json) {
          return ProductModel.fromJson(json);
        }).toList();

        return products;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<StockListModel>> getListStock({
    required int institutionId,
  }) async {
    return request(
      'stocklist/getlist/$institutionId',
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
