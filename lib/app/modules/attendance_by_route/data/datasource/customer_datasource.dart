import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';

import 'package:http/http.dart' as http;

abstract class CustomerDataSource {
  Future<List<CustomerListByRouteModel>> getList(
      {required int tbInstitutionId, required int tbSalesRouteId});
  Future<void> sequence(
      {required int tbInstitutionId,
      required int tbSalesRouteId,
      required int tbCustomerId,
      required int sequence});
}

class CustomerDataSourceImpl extends CustomerDataSource {
  final client = http.Client();
  List<CustomerListByRouteModel> items = [];

  @override
  Future<List<CustomerListByRouteModel>> getList(
      {required int tbInstitutionId, required int tbSalesRouteId}) async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}customer/salesroute/getlist/$tbInstitutionId/$tbSalesRouteId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return CustomerListByRouteModel.fromJson(json);
        }).toList();

        return items;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> sequence(
      {required int tbInstitutionId,
      required int tbSalesRouteId,
      required int tbCustomerId,
      required int sequence}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute/sequence/');
      var body = {
        "tb_institution_id": tbInstitutionId,
        "tb_sales_route_id": tbSalesRouteId,
        "tb_customer_id": tbCustomerId,
        "sequence": sequence
      };

      final response = await client.post(
        uri,
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
