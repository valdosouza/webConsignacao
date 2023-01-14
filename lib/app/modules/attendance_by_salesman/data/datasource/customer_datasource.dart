import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';

import 'package:http/http.dart' as http;

abstract class CustomerDataSource {
  Future<List<CustomerListModel>> getList();
}

class CustomerDataSourceImpl extends CustomerDataSource {
  final client = http.Client();
  List<CustomerListModel> items = [];
  var tbInstitutionId = 1;
  @override
  Future<List<CustomerListModel>> getList() async {
    try {
      final uri = Uri.parse(
          '${baseApiUrl}customer/salesman/getlist/$tbInstitutionId/2');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return CustomerListModel.fromJson(json);
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
