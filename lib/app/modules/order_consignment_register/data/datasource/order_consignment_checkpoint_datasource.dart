import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderConsignmentCheckpointDatasource extends Gateway {
  OrderConsignmentCheckpointDatasource({required super.httpClient});

  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model);

  Future<String> delete(int tbOrderId);
}

class OrderConsignmentCheckpointDatasourceImpl
    extends OrderConsignmentCheckpointDatasource {
  OrderConsignmentCheckpointDatasourceImpl({required super.httpClient});

  @override
  Future<OrderConsignmentCheckpointModel> post(
      OrderConsignmentCheckpointModel model) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });

    model.order.tbInstitutionId = tbInstitutionId;
    model.order.tbSalesmanId = tbUserId;

    var bodyConsignment = jsonEncode(model.toJson());
    return await request(
      'orderconsignment/checkpoint',
      data: bodyConsignment,
      method: HTTPMethod.post,
      timeout: const Duration(milliseconds: 15000),
      (payload) {
        if (statusCode == 200) {
          return model;
        } else {
          throw ServerException();
        }
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<String> delete(int tbOrderId) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    return await request(
      'orderconsignment/$tbInstitutionId/$tbOrderId',
      method: HTTPMethod.delete,
      (payload) {
        if (statusCode == 200) {
          return payload;
        } else {
          throw ServerException();
        }
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
