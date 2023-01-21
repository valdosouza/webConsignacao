import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class OrderStockAdjustmentRegisterDataSource extends Gateway {
  OrderStockAdjustmentRegisterDataSource({required super.httpClient});

  Future<List<OrderStockAdjustmentRegisterModel>> getlist();
  Future<OrderStockAdjustmentRegisterModel> get(
      {required int orderStockAdjustmentId});
  Future<OrderStockAdjustmentRegisterModel> post(
      {required OrderStockAdjustmentRegisterModel model});
  Future<OrderStockAdjustmentRegisterModel> put(
      {required OrderStockAdjustmentRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductListModel>> getListProducts();
  Future<List<StockListModel>> getListStock();
  Future<List<EntityListModel>> getListEtities();
  Future<String> closure({required OrderStatusModel model});
  Future<String> reopen({required OrderStatusModel model});
}

class OrderStockAdjustmentRegisterDataSourceImpl
    extends OrderStockAdjustmentRegisterDataSource {
  List<OrderStockAdjustmentRegisterModel> orderStockAdjustment = [];
  List<ProductListModel> products = [];
  List<StockListModel> stock = [];
  List<EntityListModel> entity = [];

  OrderStockAdjustmentRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<OrderStockAdjustmentRegisterModel>> getlist() async {
    try {
      final tbInstitutionId = await getInstitutionId();

      final uri =
          Uri.parse('${baseApiUrl}orderstockadjust/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        orderStockAdjustment = (data as List).map((json) {
          return OrderStockAdjustmentRegisterModel.fromJson(json);
        }).toList();

        return orderStockAdjustment;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStockAdjustmentRegisterModel> post(
      {required OrderStockAdjustmentRegisterModel model}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final tbUserId = await getUserId();

      model.tbInstitutionId = tbInstitutionId;
      model.tbUserId = tbUserId;

      final uri = Uri.parse('${baseApiUrl}orderstockadjust');
      final body = jsonEncode(model.toJson());
      final response = await httpClient.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockAdjustmentRegisterModel.fromListJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStockAdjustmentRegisterModel> put(
      {required OrderStockAdjustmentRegisterModel model}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final tbUserId = await getUserId();

      model.tbInstitutionId = tbInstitutionId;
      model.tbUserId = tbUserId;

      final uri = Uri.parse('${baseApiUrl}orderstockadjust');

      final response = await httpClient.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockAdjustmentRegisterModel.fromListJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> delete({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderstockadjust/$id');

      final response = await httpClient.delete(uri);

      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStockAdjustmentRegisterModel> get(
      {required int orderStockAdjustmentId}) async {
    try {
      final tbInstitutionId = await getInstitutionId();

      final uri = Uri.parse(
          '${baseApiUrl}orderstockadjust/get/$tbInstitutionId/$orderStockAdjustmentId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockAdjustmentRegisterModel.fromListJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductListModel>> getListProducts() async {
    try {
      final tbInstitutionId = await getInstitutionId();

      final uri = Uri.parse('${baseApiUrl}product/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products = (data as List).map((json) {
          return ProductListModel.fromJson(json);
        }).toList();

        return products;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<StockListModel>> getListStock() async {
    try {
      final tbInstitutionId = await getInstitutionId();

      final uri = Uri.parse('${baseApiUrl}stocklist/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        stock = (data as List).map((json) {
          return StockListModel.fromJson(json);
        }).toList();

        return stock;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<EntityListModel>> getListEtities() async {
    try {
      final uri = Uri.parse('${baseApiUrl}entity');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        entity = (data as List).map((json) {
          return EntityListModel.fromJson(json);
        }).toList();

        return entity;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> closure({required OrderStatusModel model}) async {
    final tbInstitutionId = await getInstitutionId();
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
    final tbInstitutionId = await getInstitutionId();
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
