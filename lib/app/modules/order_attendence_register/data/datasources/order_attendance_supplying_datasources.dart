import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderAttendanceSupplyingDatasource {
  Future<OrderAttendanceSupplyingModel> get(int tbInstitutionId, int id);
  Future<OrderAttendanceSupplyingModel> getlast(int tbInstitutionId, int id);
  Future<OrderAttendanceSupplyingModel> post(OrderAttendanceSupplyingModel model);
}

class OrderAttendanceSupplyingDatasourceImpl implements OrderAttendanceSupplyingDatasource{
  final client = http.Client();

  OrderAttendanceSupplyingDatasourceImpl();

  @override
  Future<OrderAttendanceSupplyingModel> get(int tbInstitutionId, int id) async {
    try {
      final uri = Uri.parse('$baseApiUrl/orderconsignment/supplying/get/$tbInstitutionId/$id');
      final response = await client
          .get(uri);
      if (response.statusCode == 200) {
        var decode = json.decode(response.body) as Map<String, dynamic>;
        return OrderAttendanceSupplyingModel.fromJson(decode);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceSupplyingModel> getlast(int tbInstitutionId, int id) async {
    try {
      final uri = Uri.parse('$baseApiUrl/orderconsignment/getlast/$tbInstitutionId/$id');
      final response = await client
          .get(uri);
      if (response.statusCode == 200) {
        var decode = json.decode(response.body) as Map<String, dynamic>;
        return OrderAttendanceSupplyingModel.fromJson(decode);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceSupplyingModel> post(OrderAttendanceSupplyingModel model) async{
    try {
      final uri = Uri.parse('$baseApiUrl/orderconsignment/supplying');
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200) {
        return OrderAttendanceSupplyingModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}