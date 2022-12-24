import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../../../core/shared/constants.dart';
import '../models/order_attendance_model.dart';

abstract class OrderAttendanceDatasource {
  Future<List<OrderAttendanceModel>> getAll(int tbInstitutionId);
  Future<OrderAttendanceModel> get(int tbInstitutionId, int id);
  Future<OrderAttendanceModel> post(OrderAttendanceModel model);
  Future<OrderAttendanceModel> put(OrderAttendanceModel model);
  Future<OrderAttendanceModel> delete(int tbInstitutionId, int id);
}

class OrderAttendanceDatasourceImpl implements OrderAttendanceDatasource {
  final client = http.Client();

  OrderAttendanceDatasourceImpl();

  @override
  Future<OrderAttendanceModel> delete(int tbInstitutionId, int id) async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}orderattendance/$tbInstitutionId/$id');
      final response = await client.delete(uri);
      if (response.statusCode == 200) {
        return OrderAttendanceModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceModel> get(int tbInstitutionId, int id) async {
    try {
      final uri =
          Uri.parse('$baseApiUrl/orderattendance/get/$tbInstitutionId/$id');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var decode = json.decode(response.body) as Map<String, dynamic>;
        return OrderAttendanceModel.fromJson(decode);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderAttendanceModel>> getAll(int tbInstitutionId) async {
    try {
      final uri =
          Uri.parse('$baseApiUrl/orderattendance/getlist/$tbInstitutionId');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        List<OrderAttendanceModel> result = (json.decode(response.body) as List)
            .map((i) => OrderAttendanceModel.fromJson(i))
            .toList();

        return result;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceModel> post(OrderAttendanceModel model) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderattendance');
      final bodyorder = jsonEncode(model.toJson());
      final response = await client.post(
        uri,
        body: bodyorder,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return OrderAttendanceModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceModel> put(OrderAttendanceModel model) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderattendance');
      final response = await client.put(
        uri,
        body: jsonEncode(model.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return OrderAttendanceModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
