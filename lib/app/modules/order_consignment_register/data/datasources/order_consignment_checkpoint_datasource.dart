import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderConsignmentCheckpointDatasource {
  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model);
}

class OrderConsignmentCheckpointDatasourceImpl
    implements OrderConsignmentCheckpointDatasource {
  final client = http.Client();

  OrderConsignmentCheckpointDatasourceImpl();

  @override
  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model) async {
    try {
      final uri = Uri.parse('${baseApiUrl}orderconsignment/checkpoint');
      var bodyConsignment = jsonEncode(model.toJson());

      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyConsignment,
      );
      if (response.statusCode == 200) {
        return model;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
