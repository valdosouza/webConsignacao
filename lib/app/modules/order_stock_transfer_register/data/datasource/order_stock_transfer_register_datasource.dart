import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderStockTransferRegisterDataSource extends Gateway {
  OrderStockTransferRegisterDataSource({required super.httpClient});

  Future<List<OrderStockTransferListModel>> getlist();
  Future<OrderStockTransferMainModel> get({required int orderStockId});
  Future<OrderStockTransferListModel> post(
      {required OrderStockTransferMainModel model});
  Future<OrderStockTransferListModel> put(
      {required OrderStockTransferMainModel model});
  Future<String> delete({required int id});
  Future<List<StockListModel>> getListStock();
  Future<List<EntityListModel>> getListEntity();
  Future<List<ProductListModel>> getListProduct();
  Future<String> closure({required OrderStatusModel model});
  Future<String> reopen({required OrderStatusModel model});
}

class OrderStockTransferRegisterDataSourceImpl
    extends OrderStockTransferRegisterDataSource {
  List<OrderStockTransferListModel> orderStock = [];
  List<StockListModel> stock = [];
  List<EntityListModel> entities = [];
  List<ProductListModel> products = [];

  OrderStockTransferRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderStockTransferListModel>> getlist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'orderstocktransfer/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        orderStock.clear();
        if (data.length > 0) {
          orderStock = (data as List).map((json) {
            return OrderStockTransferListModel.fromJson(json);
          }).toList();
        }
        return orderStock;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<EntityListModel>> getListEntity() async {
    return request(
      'entity',
      (payload) {
        final data = json.decode(payload);
        entities = (data as List).map((json) {
          return EntityListModel.fromJson(json);
        }).toList();

        return entities;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<ProductListModel>> getListProduct() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'product/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        products = (data as List).map((json) {
          return ProductListModel.fromJson(json);
        }).toList();

        return products;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<OrderStockTransferListModel> post({
    required OrderStockTransferMainModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });
    model.order.tbInstitutionId = tbInstitutionId;
    model.order.tbUserId = tbUserId;

    final body = jsonEncode(model.toJson());
    return request(
      'orderstocktransfer',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockTransferListModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<OrderStockTransferListModel> put(
      {required OrderStockTransferMainModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      int tbUserId = 1;
      await getUserId().then((value) {
        (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
      });
      model.order.tbInstitutionId = tbInstitutionId;
      model.order.tbUserId = tbUserId;
      final body = jsonEncode(model.toJson());
      return request(
        'orderstocktransfer',
        method: HTTPMethod.put,
        data: body,
        (payload) {
          final data = json.decode(payload);
          var model = OrderStockTransferListModel.fromJson(data);
          return model;
        },
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
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderstocktransfer/$tbInstitutionId/$id',
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
  Future<OrderStockTransferMainModel> get({
    required int orderStockId,
  }) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderstocktransfer/get/$tbInstitutionId/$orderStockId',
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockTransferMainModel.fromJson(data);
        return model;
      },
      onError: (error) {
        throw ServerException;
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
        throw ServerException;
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
      'orderstocktransfer/closure',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return Future.error(ServerException());
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
      'orderstocktransfer/reopen',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = payload;
        //var model = OrderStatusModel.fromJson(data);
        return data;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
