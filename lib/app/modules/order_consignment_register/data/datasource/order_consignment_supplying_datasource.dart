import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderConsignmentSupplyingDatasource extends Gateway {
  OrderConsignmentSupplyingDatasource({required super.httpClient});

  Future<OrderConsignmentSupplyingModel> getlast({required int tbCustomerId});
  Future<OrderConsignmentSupplyingModel> post(
      OrderConsignmentSupplyingModel model);
}

class OrderConsignmentSupplyingDatasourceImpl
    extends OrderConsignmentSupplyingDatasource {
  OrderConsignmentSupplyingDatasourceImpl({required super.httpClient});

  @override
  Future<OrderConsignmentSupplyingModel> getlast(
      {required int tbCustomerId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}orderconsignment/getlast/$tbInstitutionId/$tbCustomerId');
      final response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        //var decode = json.decode(response.body) as Map<String, dynamic>;
        var data = json.decode(response.body);

        return OrderConsignmentSupplyingModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderConsignmentSupplyingModel> post(
      OrderConsignmentSupplyingModel model) async {
    try {
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
        'orderconsignment/supplying',
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
    } catch (error) {
      throw ServerException();
    }
  }
}
