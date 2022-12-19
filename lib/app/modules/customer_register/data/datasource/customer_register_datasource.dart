import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:http/http.dart' as http;

abstract class CustomerRegisterDataSource {
  Future<List<CustomerListModel>> getList({required int tbInstitutionId});
  Future<CustomerMainModel> get(
      {required int tbInstitutionId, required int id});
  Future<CustomerMainModel> post({required CustomerMainModel customer});
}

class CustomerRegisterDataSourceImpl extends CustomerRegisterDataSource {
  final client = http.Client();
  List<CustomerListModel> items = [];

  @override
  Future<List<CustomerListModel>> getList(
      {required int tbInstitutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer/getlist/$tbInstitutionId');

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

  @override
  Future<CustomerMainModel> get(
      {required int tbInstitutionId, required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer/get/$tbInstitutionId/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = CustomerMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CustomerMainModel> post({required CustomerMainModel customer}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer');

      var bodyCustomer = jsonEncode(customer.toJson());
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyCustomer,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = CustomerMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
