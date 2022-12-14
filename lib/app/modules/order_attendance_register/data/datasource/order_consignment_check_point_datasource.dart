import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderConsignmentCheckPointDataSource {
  Future<List<OrderConsignmentCheckPointModel>>
      getOrderConsignmentCheckPointList();
  Future<OrderConsignmentCheckPointModel> getOrderConsignmentCheckPoint(int id);
  Future<void> addOrderConsignmentCheckPoint(
      OrderConsignmentCheckPointModel orderConsignmentCheckPoint);
  Future<void> updateOrderConsignmentCheckPoint(
      OrderConsignmentCheckPointModel orderConsignmentCheckPoint);
  Future<void> deleteOrderConsignmentCheckPoint(int id);
}

class OrderConsignmentCheckPointDataSourceImpl
    implements OrderConsignmentCheckPointDataSource {
  final client = http.Client();

  @override
  Future<List<OrderConsignmentCheckPointModel>>
      getOrderConsignmentCheckPointList() async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/checkpoint');
    final uri = Uri.parse('https://6399f0ae16b0fdad774ece19.mockapi.io/checkpoint');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data as List)
            .map((e) => OrderConsignmentCheckPointModel.fromJson(
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
  Future<OrderConsignmentCheckPointModel> getOrderConsignmentCheckPoint(
      int id) async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/checkpoint/$id');
    final uri = Uri.parse('https://6399f0ae16b0fdad774ece19.mockapi.io/checkpoint/$id'); 
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return OrderConsignmentCheckPointModel.fromJson(
            data as Map<String, dynamic>);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> addOrderConsignmentCheckPoint(
      OrderConsignmentCheckPointModel orderConsignmentCheckPoint) async {
    //final uri = Uri.parse('${baseApiUrl}orderconsignment/checkpoint');
    final uri = Uri.parse('https://6399f0ae16b0fdad774ece19.mockapi.io/checkpoint');
    try {
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderConsignmentCheckPoint.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateOrderConsignmentCheckPoint(
      OrderConsignmentCheckPointModel orderConsignmentCheckPoint) async {
    final uri = Uri.parse(
        '${baseApiUrl}orderconsignment/checkpoint/${orderConsignmentCheckPoint.tbInstitutionId}');
    try {
      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderConsignmentCheckPoint.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteOrderConsignmentCheckPoint(int id) async {
    final uri = Uri.parse('${baseApiUrl}orderconsignment/checkpoint/$id');
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
