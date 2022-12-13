import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderAttendanceRegisterDataSource {
  Future<List<OrderAttendanceRegisterModel>> getlist({required int id});
  Future<OrderAttendanceRegisterMainModel> get(
      {required int id});
  Future<OrderAttendanceRegisterMainModel> post(
      {required OrderAttendanceRegisterMainModel model});
  Future<OrderAttendanceRegisterMainModel> put(
      {required OrderAttendanceRegisterMainModel model});
  Future<String> delete({required int id});
}

class OrderAttendanceRegisterDataSourceImpl extends OrderAttendanceRegisterDataSource {
  final client = http.Client();
  List<OrderAttendanceRegisterModel> orderAttendanceRegister = [];

  @override
  Future<List<OrderAttendanceRegisterModel>> getlist({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderattendanceregister/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        orderAttendanceRegister = (data as List).map((json) {
          return OrderAttendanceRegisterModel.fromJson(json);
        }).toList();

        return orderAttendanceRegister;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceRegisterMainModel> post(
      {required OrderAttendanceRegisterMainModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderattendanceregister');

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderAttendanceRegisterMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceRegisterMainModel> put(
      {required OrderAttendanceRegisterMainModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderattendanceregister');

      final response = await client.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderAttendanceRegisterMainModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}orderattendanceregister/$id');

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
  Future<OrderAttendanceRegisterMainModel> get(
      {required int id}) async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}orderattendanceregister/get/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = OrderAttendanceRegisterMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
