import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:http/http.dart' as http;

/// Throws a [ServerException] for all error codes.
abstract class OrderProductionRegisterDatasource {
  Future<List<OrderProductionModel>> getlist({required int institutionId});
  // Future<StockListModel> post({required StockListModel model});
  // Future<String> put({required StockListModel model});
  // Future<String> delete({required int id});
}

class OrderProductionRegisterDatasourceImpl
    implements OrderProductionRegisterDatasource {
  final client = http.Client();
  List<OrderProductionModel> items = [];
  @override
  Future<List<OrderProductionModel>> getlist(
      {required int institutionId}) async {
    try {
      final uri =
          Uri.parse('$baseApiUrl/orderproduction/getlist/$institutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return OrderProductionModel.fromJson(json);
        }).toList();

        return items;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  // @override
  // Future<StockListModel> post({required StockListModel model}) async {
  //   final uri = Uri.parse('${baseApiUrl}stockList');
  //   try {
  //     final response = await client.post(
  //       uri,
  //       body: model.toJson(),
  //     );

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       StockListModel result = StockListModel.fromJson(data);
  //       return result;
  //     } else {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<String> put({required StockListModel model}) async {
  //   try {
  //     final uri = Uri.parse('${baseApiUrl}stockList');

  //     final response = await client.put(uri, body: model.toJson());

  //     if (response.statusCode == 200) {
  //       return "";
  //     } else {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<String> delete({required int id}) async {
  //   try {
  //     final uri = Uri.parse('${baseApiUrl}StockList/$id');

  //     final response = await client.delete(uri);

  //     if (response.statusCode == 200) {
  //       return "";
  //     } else {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     throw ServerException();
  //   }
  // }
}
