import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

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
      final tbInstitutionId = await getInstitutionId();

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
      final tbInstitutionId = await getInstitutionId();

      model.order.tbInstitutionId = tbInstitutionId;

      final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying');
      var bodyConsignment = jsonEncode(model.toJson());
      final response = await httpClient.post(
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
