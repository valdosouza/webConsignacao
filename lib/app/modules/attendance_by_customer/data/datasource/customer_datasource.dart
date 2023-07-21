import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';

import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';

abstract class CustomerDataSource extends Gateway {
  CustomerDataSource({required super.httpClient});
  Future<List<CustomerListModel>> getList();
}

class CustomerDataSourceImpl extends CustomerDataSource {
  List<CustomerListModel> items = [];

  CustomerDataSourceImpl({required super.httpClient});

  @override
  Future<List<CustomerListModel>> getList() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      String tbUserId = '1';
      await getUserId().then((value) {
        tbUserId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}customer/salesman/getlist/$tbInstitutionId/$tbUserId');

      final response = await httpClient.get(uri);

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
