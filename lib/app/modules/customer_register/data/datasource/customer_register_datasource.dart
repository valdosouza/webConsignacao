import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';

abstract class CustomerRegisterDataSource extends Gateway {
  CustomerRegisterDataSource({required super.httpClient});

  Future<List<CustomerListModel>> getList({
    required int tbInstitutionId,
  });
  Future<CustomerMainModel> get({
    required int tbInstitutionId,
    required int id,
  });

  Future<CustomerListModel> post({required CustomerMainModel customer});
}

class CustomerRegisterDataSourceImpl extends CustomerRegisterDataSource {
  List<CustomerListModel> items = [];

  CustomerRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<CustomerListModel>> getList({
    required int tbInstitutionId,
  }) async {
    return await request(
      'customer/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);

        items = (data as List).map((json) {
          return CustomerListModel.fromJson(json);
        }).toList();

        return items;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<CustomerMainModel> get({
    required int tbInstitutionId,
    required int id,
  }) async {
    return await request(
      'customer/get/$tbInstitutionId/$id',
      (payload) {
        final data = json.decode(payload);
        var model = CustomerMainModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<CustomerListModel> post({
    required CustomerMainModel customer,
  }) async {
    var bodyCustomer = jsonEncode(customer.toJson());

    return await request(
      'customer',
      data: bodyCustomer,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        var model = CustomerListModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
