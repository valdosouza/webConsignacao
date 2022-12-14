import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/stock_list_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderStockAdjustmentRegisterDataSource {
  Future<List<OrderStockAdjustmentRegisterModel>> getlist({required int id});
  Future<OrderStockAdjustmentRegisterModel> get(
      {required int institutionId, required int orderStockAdjustmentId});
  Future<OrderStockAdjustmentRegisterModel> post(
      {required OrderStockAdjustmentRegisterModel model});
  Future<OrderStockAdjustmentRegisterModel> put(
      {required OrderStockAdjustmentRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductModel>> getListProducts({required int institutionId});
  Future<List<StockListModel>> getListStock({required int institutionId});
  Future<List<EntityListModel>> getListEtities();
  Future<void> close({required OrderStockAdjustmentRegisterModel model});
  Future<void> reopen({required OrderStockAdjustmentRegisterModel model});
}

class OrderStockAdjustmentRegisterDataSourceImpl
    extends OrderStockAdjustmentRegisterDataSource {
  final client = http.Client();
  List<OrderStockAdjustmentRegisterModel> orderStockAdjustment = [];
  List<ProductModel> products = [];
  List<StockListModel> stock = [];
  List<EntityListModel> entity = [];

  @override
  Future<List<OrderStockAdjustmentRegisterModel>> getlist(
      {required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderstockadjust/getlist/$id');

      final response = await client.get(uri);

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
      final uri = Uri.parse('${baseApiUrl}orderstockadjust');
      final body = jsonEncode(model.toJson());
      final response = await client.post(uri,
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
      final uri = Uri.parse('${baseApiUrl}orderstockadjust');

      final response = await client.put(
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

      final response = await client.delete(uri);

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
      {required int institutionId, required int orderStockAdjustmentId}) async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}orderstockadjust/get/$institutionId/$orderStockAdjustmentId');

      final response = await client.get(uri);

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
  Future<List<ProductModel>> getListProducts(
      {required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}product/getlist/$institutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products = (data as List).map((json) {
          return ProductModel.fromJson(json);
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
  Future<List<StockListModel>> getListStock(
      {required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}stocklist/getlist/$institutionId');

      final response = await client.get(uri);

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

      final response = await client.get(uri);

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
  Future<void> close({required OrderStockAdjustmentRegisterModel model}) {
    throw UnimplementedError();
  }

  @override
  Future<void> reopen({required OrderStockAdjustmentRegisterModel model}) {
    throw UnimplementedError();
  }
}
