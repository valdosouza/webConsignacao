import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderStockTransferRegisterDataSource {
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
}

class OrderStockTransferRegisterDataSourceImpl
    extends OrderStockTransferRegisterDataSource {
  final client = http.Client();
  List<OrderStockTransferRegisterOrderModel> orderStock = [];
  List<StockListModel> stock = [];
  List<CustomerListModel> entities = [];

  @override
  Future<List<OrderStockTransferRegisterOrderModel>> getlist(
      {required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderstocktransfer/getlist/1');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        orderStock = (data as List).map((json) {
          return OrderStockTransferRegisterOrderModel.fromJson(json);
        }).toList();

        return orderStock;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CustomerListModel>> getListEntity({
    required int institutionId,
  }) async {
    try {
      final uri = Uri.parse('${baseApiUrl}entity/');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        entities = (data as List).map((json) {
          return CustomerListModel.fromJson(json);
        }).toList();

        return entities;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStockTransferRegisterOrderModel> post({
    required OrderStockTransferRegisterOrderModel model,
  }) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderstocktransfer/');
      final body = jsonEncode(model.toJson());
      final response = await client.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockTransferRegisterOrderModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStockTransferRegisterOrderModel> put(
      {required OrderStockTransferRegisterOrderModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderstocktransfer/');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockTransferRegisterOrderModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}orderstocktransfer/1/$id');

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
  Future<OrderStockTransferRegisterOrderModel> get({
    required int institutionId,
    required int orderStockId,
  }) async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}orderstocktransfer/get/$institutionId/$orderStockId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderStockTransferRegisterOrderModel.fromJson(data);
        return model;
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
