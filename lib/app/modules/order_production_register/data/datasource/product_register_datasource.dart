import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderProductionRegisterDataSource {
  Future<List<OrderProductionRegisterModel>> getlist({required int id});
  Future<OrderProductionRegisterModel> get(
      {required int institutionId, required int orderProductionId});
  Future<OrderProductionRegisterModel> post(
      {required OrderProductionRegisterModel model});
  Future<OrderProductionRegisterModel> put(
      {required OrderProductionRegisterModel model});
  Future<String> delete({required int id});
  Future<List<ProductModel>> getListProducts(
      {required int institutionId});
  Future<List<StockListModel>> getListStock({required int institutionId});
}

class ProductRegisterDataSourceImpl extends OrderProductionRegisterDataSource {
  final client = http.Client();
  List<OrderProductionRegisterModel> orderProduction = [];
  List<ProductModel> products = [];
  List<StockListModel> stock = [];

  @override
  Future<List<OrderProductionRegisterModel>> getlist({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderproduction/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        orderProduction = (data as List).map((json) {
          return OrderProductionRegisterModel.fromJson(json);
        }).toList();

        return orderProduction;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderProductionRegisterModel> post(
      {required OrderProductionRegisterModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderproduction');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderProductionRegisterModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderProductionRegisterModel> put(
      {required OrderProductionRegisterModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderproduction');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderProductionRegisterModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}orderproduction/$id');

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
  Future<OrderProductionRegisterModel> get(
      {required int institutionId, required int orderProductionId}) async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}orderproduction/get/$institutionId/$orderProductionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderProductionRegisterModel.fromJson(data);
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
}
