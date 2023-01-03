import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/domain/entity/product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';

abstract class OrderStockTransferRegisterDataSource extends Gateway {
  OrderStockTransferRegisterDataSource({required super.httpClient});

  Future<List<OrderStockTransferRegisterOrderModel>> getlist({required int id});
  Future<OrderStockTransferRegisterOrderModel> get(
      {required int institutionId, required int orderStockId});
  Future<OrderStockTransferRegisterOrderModel> post(
      {required OrderStockTransferRegisterOrderModel model});
  Future<OrderStockTransferRegisterOrderModel> put(
      {required OrderStockTransferRegisterOrderModel model});
  Future<String> delete({required int id});
  Future<List<StockListModel>> getListStock({required int institutionId});
  Future<List<CustomerListModel>> getListEntity({required int institutionId});
  Future<List<ProductModel>> getListProduct({required int institutionId});
}

class OrderStockTransferRegisterDataSourceImpl
    extends OrderStockTransferRegisterDataSource {
  List<OrderStockTransferRegisterOrderModel> orderStock = [];
  List<StockListModel> stock = [];
  List<CustomerListModel> entities = [];
  List<ProductModel> products = [];

  OrderStockTransferRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderStockTransferRegisterOrderModel>> getlist(
      {required int id}) async {
    return await request(
      '/orderstocktransfer/getlist/$id',
      (payload) {
        final data = json.decode(payload);
        orderStock = (data as List).map((json) {
          return OrderStockTransferRegisterOrderModel.fromJson(json);
        }).toList();

        return orderStock;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CustomerListModel>> getListEntity({
    required int institutionId,
  }) async {
    return request(
      '/entity',
      (payload) {
        final data = json.decode(payload);
        entities = (data as List).map((json) {
          return CustomerListModel.fromJson(json);
        }).toList();

        return entities;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<ProductModel>> getListProduct({
    required int institutionId,
  }) async {
    return await request(
      '/product/getlist/$institutionId',
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
  Future<OrderStockTransferRegisterOrderModel> post({
    required OrderStockTransferRegisterOrderModel model,
  }) async {
    final body = jsonEncode(model.toJson());
    return request(
      '/orderstocktransfer',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockTransferRegisterOrderModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderStockTransferRegisterOrderModel> put(
      {required OrderStockTransferRegisterOrderModel model}) async {
    try {
      return request(
        '/orderstocktransfer',
        method: HTTPMethod.put,
        (payload) {
          final data = json.decode(payload);
          var model = OrderStockTransferRegisterOrderModel.fromJson(data);
          return model;
        },
        data: jsonEncode(
          model.toJson(),
        ),
        onError: (error) {
          throw ServerException();
        },
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> delete({required int id}) async {
    return request(
      '/orderstocktransfer/1/$id',
      method: HTTPMethod.delete,
      (payload) {
        return "";
      },
      onError: (error) {
        throw ServerException;
      },
    );
  }

  @override
  Future<OrderStockTransferRegisterOrderModel> get({
    required int institutionId,
    required int orderStockId,
  }) async {
    return request(
      '/orderstocktransfer/get/$institutionId/$orderStockId',
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockTransferRegisterOrderModel.fromJson(data);
        return model;
      },
      onError: (error) {
        throw ServerException;
      },
    );
  }

  @override
  Future<List<StockListModel>> getListStock({
    required int institutionId,
  }) async {
    return request(
      '/stocklist/getlist/$institutionId',
      (payload) {
        final data = json.decode(payload);
        stock = (data as List).map((json) {
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
