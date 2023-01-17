import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:http/http.dart' as http;

abstract class OrderConsignmentSupplyingDatasource {
  Future<OrderConsignmentSupplyingModel> getlast({required int tbCustomerId});
  Future<OrderConsignmentSupplyingModel> post(
      OrderConsignmentSupplyingModel model);
}

class OrderConsignmentSupplyingDatasourceImpl
    implements OrderConsignmentSupplyingDatasource {
  final client = http.Client();
  var tbInstitutionId = 1;
  OrderConsignmentSupplyingDatasourceImpl();

  @override
  Future<OrderConsignmentSupplyingModel> getlast(
      {required int tbCustomerId}) async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}orderconsignment/getlast/$tbInstitutionId/$tbCustomerId');
      final response = await client.get(uri);
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
      final uri = Uri.parse('${baseApiUrl}orderconsignment/supplying');
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
