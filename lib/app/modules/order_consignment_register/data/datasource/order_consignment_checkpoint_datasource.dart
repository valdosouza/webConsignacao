import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';

abstract class OrderConsignmentCheckpointDatasource extends Gateway {
  OrderConsignmentCheckpointDatasource({required super.httpClient});

  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model);
}

class OrderConsignmentCheckpointDatasourceImpl
    extends OrderConsignmentCheckpointDatasource {
  OrderConsignmentCheckpointDatasourceImpl({required super.httpClient});

  var tbInstitutionId = 1;

  @override
  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model) async {
    var tbInstitutionId = getInstitutionId();

    model.order.tbInstitutionId = tbInstitutionId as int;

    var bodyConsignment = jsonEncode(model.toJson());
    return await request(
      'orderconsignment/checkpoint',
      data: bodyConsignment,
      method: HTTPMethod.post,
      (payload) {
        //final data = json.decode(payload);
        return model;
        //return OrderConsignmentCheckpointModel.fromJson(data);
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
