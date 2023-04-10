import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_main_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderStockAdjustmentRegisterDataSource extends Gateway {
  OrderStockAdjustmentRegisterDataSource({required super.httpClient});

  Future<List<OrderStockAdjustmentListModel>> getlist();
  Future<OrderStockAdjustmentMainModel> get({required int orderStockId});
  Future<OrderStockAdjustmentListModel> post(
      {required OrderStockAdjustmentMainModel model});
  Future<OrderStockAdjustmentListModel> put(
      {required OrderStockAdjustmentMainModel model});
  Future<String> delete({required int id});
  Future<List<StockListModel>> getListStock();
  Future<List<EntityListModel>> getListEntity();
  Future<List<ProductListModel>> getListProduct();
  Future<String> closure({required OrderStatusModel model});
  Future<String> reopen({required OrderStatusModel model});
}

class OrderStockAdjustmentRegisterDataSourceImpl
    extends OrderStockAdjustmentRegisterDataSource {
  List<OrderStockAdjustmentListModel> orderStock = [];
  List<StockListModel> stock = [];
  List<EntityListModel> entities = [];
  List<ProductListModel> products = [];

  OrderStockAdjustmentRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderStockAdjustmentListModel>> getlist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'orderstockadjust/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        orderStock.clear();
        if (data.length > 0) {
          orderStock = (data as List).map((json) {
            return OrderStockAdjustmentListModel.fromJson(json);
          }).toList();
        }
        return orderStock;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<EntityListModel>> getListEntity() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'entity/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        entities = (data as List).map((json) {
          return EntityListModel.fromJson(json);
        }).toList();

        return entities;
      },
      onError: (error) {
        return ServerException;
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
        return ServerException;
      },
    );
  }

  @override
  Future<OrderStockAdjustmentListModel> post({
    required OrderStockAdjustmentMainModel model,
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
      'orderstockadjust',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockAdjustmentListModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<OrderStockAdjustmentListModel> put(
      {required OrderStockAdjustmentMainModel model}) async {
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
        'orderstockadjust',
        method: HTTPMethod.put,
        data: body,
        (payload) {
          final data = json.decode(payload);
          var model = OrderStockAdjustmentListModel.fromJson(data);
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
      'orderstockadjust/$tbInstitutionId/$id',
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
  Future<OrderStockAdjustmentMainModel> get({
    required int orderStockId,
  }) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return request(
      'orderstockadjust/get/$tbInstitutionId/$orderStockId',
      (payload) {
        final data = json.decode(payload);
        var model = OrderStockAdjustmentMainModel.fromJson(data);
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
      'orderstockadjust/closure',
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
      'orderstockadjust/reopen',
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
