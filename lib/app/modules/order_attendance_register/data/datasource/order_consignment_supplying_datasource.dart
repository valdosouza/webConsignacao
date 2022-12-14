import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderConsignmentSupplyingDataSource {
  Future<List<OrderConsignmentSupplyingModel>>
      getOrderConsignmentSupplyingList();
  Future<OrderConsignmentSupplyingModel> getOrderConsignmentSupplying(int id);
  Future<void> addOrderConsignmentSupplying(
      OrderConsignmentSupplyingModel orderConsignmentSupplying);
  Future<void> updateOrderConsignmentSupplying(
      OrderConsignmentSupplyingModel orderConsignmentSupplying);
  Future<void> deleteOrderConsignmentSupplying(int id);
}

class OrderConsignmentSupplyingDataSourceImpl
    implements OrderConsignmentSupplyingDataSource {
  final client = http.Client();

  @override
  Future<List<OrderConsignmentSupplyingModel>>
      getOrderConsignmentSupplyingList() async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying');
    final uri = Uri.parse('https://6399f17416b0fdad774eea04.mockapi.io/supplyng');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data as List)
            .map((e) => OrderConsignmentSupplyingModel.fromJson(
                e as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderConsignmentSupplyingModel> getOrderConsignmentSupplying(
      int id) async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying/$id');
    final uri = Uri.parse('https://6399f17416b0fdad774eea04.mockapi.io/supplyng/$id');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return OrderConsignmentSupplyingModel.fromJson(
            data as Map<String, dynamic>);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> addOrderConsignmentSupplying(
      OrderConsignmentSupplyingModel orderConsignmentSupplying) async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying');
    final uri = Uri.parse('https://6399f17416b0fdad774eea04.mockapi.io/supplyng');
    try {
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderConsignmentSupplying.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateOrderConsignmentSupplying(
      OrderConsignmentSupplyingModel orderConsignmentSupplying) async {
    final uri = Uri.parse(
        '${baseApiUrl}orderconsignment/supplying/${orderConsignmentSupplying.tbInstitutionId}');
    try {
      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderConsignmentSupplying.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteOrderConsignmentSupplying(int id) async {
    final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying/$id');
    try {
      final response = await client.delete(uri);
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
