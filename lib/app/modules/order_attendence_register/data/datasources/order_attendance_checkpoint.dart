import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderAttendanceCheckpointDatasource {
  Future<OrderAttendanceCheckpointModel> get(int tbInstitutionId, int id);
  Future<OrderAttendanceCheckpointModel> post(OrderAttendanceCheckpointModel model);
}

class OrderAttendanceCheckpointDatasourceImpl implements OrderAttendanceCheckpointDatasource{
  final client = http.Client();

  OrderAttendanceCheckpointDatasourceImpl();

  @override
  Future<OrderAttendanceCheckpointModel> get(int tbInstitutionId, int id) async {
    try {
      final uri = Uri.parse('$baseApiUrl/orderconsignment/checkpoint/get/$tbInstitutionId/$id');
      final response = await client
          .get(uri);
      if (response.statusCode == 200) {
        var decode = json.decode(response.body) as Map<String, dynamic>;
        return OrderAttendanceCheckpointModel.fromJson(decode);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderAttendanceCheckpointModel> post(OrderAttendanceCheckpointModel model) async{
    try {
      final uri = Uri.parse('$baseApiUrl/orderconsignment/checkpoint');
      final response = await client.post(
        uri,
        body: jsonEncode(model.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return OrderAttendanceCheckpointModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}