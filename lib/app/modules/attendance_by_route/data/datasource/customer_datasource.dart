import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';

import 'package:http/http.dart' as http;

abstract class CustomerDataSource {
  Future<List<CustomerListByRouteModel>> getList(
      {required int tbInstitutionId, required int tbSalesRouteId});
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
}
