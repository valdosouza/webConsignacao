import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

abstract class OrderConsignmentDatasource extends Gateway {
  OrderConsignmentDatasource({required super.httpClient});

  Future<List<OrderConsignmetListModel>> getlist({required int tbCustomerId});
  Future<OrderConsignmentCheckpointModel> getCheckpoint(
      {required int tbOrderId});
  Future<OrderConsignmentSupplyingModel> getSupplying({required int tbOrderId});
}

class OrderConsignmentDatasourceImpl extends OrderConsignmentDatasource {
  OrderConsignmentDatasourceImpl({required super.httpClient});
  List<OrderConsignmetListModel> orderList = [];
  @override
  Future<List<OrderConsignmetListModel>> getlist(
      {required int tbCustomerId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}orderconsignment/getlist/$tbInstitutionId/$tbCustomerId');
      final response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        //var decode = json.decode(response.body) as Map<String, dynamic>;
        final data = json.decode(response.body);

        orderList = (data as List).map((json) {
          return OrderConsignmetListModel.fromJson(json);
        }).toList();

        return orderList;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderConsignmentCheckpointModel> getCheckpoint(
      {required int tbOrderId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}orderconsignment/checkpoint/get/$tbInstitutionId/$tbOrderId');
      final response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        //var decode = json.decode(response.body) as Map<String, dynamic>;
        final data = json.decode(response.body);

        return OrderConsignmentCheckpointModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<OrderConsignmentSupplyingModel> getSupplying(
      {required int tbOrderId}) async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}orderconsignment/supplying/get/$tbInstitutionId/$tbOrderId');
      final response = await httpClient.get(uri);
      if (response.statusCode == 200) {
        //var decode = json.decode(response.body) as Map<String, dynamic>;
        final data = json.decode(response.body);

        return OrderConsignmentSupplyingModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException();
    }
  }
}
