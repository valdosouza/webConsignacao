import 'dart:convert';
import 'package:appweb/app/core/gateway.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/shared/constants.dart';
import '../model/order_attendance_model.dart';

abstract class OrderAttendanceDatasource extends Gateway {
  OrderAttendanceDatasource({required super.httpClient});

  Future<List<OrderAttendanceModel>> getAll();
  Future<OrderAttendanceModel> get({required int id});
  Future<OrderAttendanceModel> post({required OrderAttendanceModel model});
  Future<OrderAttendanceModel> put({required OrderAttendanceModel model});
  Future<OrderAttendanceModel> delete({required int id});
}

class OrderAttendanceDatasourceImpl extends OrderAttendanceDatasource {
  OrderAttendanceDatasourceImpl({required super.httpClient});

  @override
  Future<OrderAttendanceModel> delete({required int id}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final uri =
          Uri.parse('${baseApiUrl}orderattendance/$tbInstitutionId/$id');
      final response = await httpClient.delete(uri);
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
  Future<OrderAttendanceModel> get({required int id}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final uri =
          Uri.parse('$baseApiUrl/orderattendance/get/$tbInstitutionId/$id');
      final response = await httpClient.get(uri);
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
  Future<List<OrderAttendanceModel>> getAll() async {
    try {
      final tbInstitutionId = await getInstitutionId();

      final uri =
          Uri.parse('$baseApiUrl/orderattendance/getlist/$tbInstitutionId');
      final response = await httpClient.get(uri);

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
  Future<OrderAttendanceModel> post(
      {required OrderAttendanceModel model}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final tbUserId = await getUserId();
      final tbSalesmanId = await getUserId();

      model.tbInstitutionId = tbInstitutionId;
      model.tbUserId = tbUserId;
      model.tbSalesmanId = tbSalesmanId;

      final uri = Uri.parse('${baseApiUrl}orderattendance');
      final bodyorder = jsonEncode(model.toJson());
      final response = await httpClient.post(
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
  Future<OrderAttendanceModel> put(
      {required OrderAttendanceModel model}) async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final tbUserId = await getUserId();
      final tbSalesmanId = await getUserId();

      model.tbInstitutionId = tbInstitutionId;
      model.tbUserId = tbUserId;
      model.tbSalesmanId = tbSalesmanId;

      final uri = Uri.parse('${baseApiUrl}orderattendance');
      final response = await httpClient.put(
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
