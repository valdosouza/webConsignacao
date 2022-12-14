import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderAttendanceDataSource {
  Future<List<OrderAttendanceModel>> getOrderAttendanceList();
  Future<OrderAttendanceModel> getOrderAttendance(int id);
  Future<void> addOrderAttendance(OrderAttendanceModel orderAttendance);
  Future<void> updateOrderAttendance(OrderAttendanceModel orderAttendance);
  Future<void> deleteOrderAttendance(int id);
}

class OrderAttendanceDataSourceImpl implements OrderAttendanceDataSource {
  final client = http.Client();

  @override
  Future<List<OrderAttendanceModel>> getOrderAttendanceList() async {
    final uri = Uri.parse('${baseApiUrl}orderattendance');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data as List)
            .map(
                (e) => OrderAttendanceModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceModel> getOrderAttendance(int id) async {
    final uri = Uri.parse('${baseApiUrl}orderattendance/$id');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return OrderAttendanceModel.fromJson(data as Map<String, dynamic>);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> addOrderAttendance(OrderAttendanceModel orderAttendance) async {
    final uri = Uri.parse('${baseApiUrl}orderattendance');
    try {
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderAttendance.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateOrderAttendance(
      OrderAttendanceModel orderAttendance) async {
    final uri = Uri.parse('${baseApiUrl}orderattendance/${orderAttendance.id}');
    try {
      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderAttendance.toJson()),
      );
      if (response.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteOrderAttendance(int id) async {
    final uri = Uri.parse('${baseApiUrl}orderattendance/$id');
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
