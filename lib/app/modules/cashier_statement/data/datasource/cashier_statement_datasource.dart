import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';

abstract class CashierStatementDataSource extends Gateway {
  CashierStatementDataSource({required super.httpClient});

  Future<List<CashierStatementModel>> cashierStatementGetByDay({
    required CashierStatementParams params,
  });
  Future<List<CashierStatementModel>> cashierStatementGetByMonth({
    required CashierStatementParams params,
  });
  Future<List<CashierStatementModel>> cashierStatementGetByCustomer({
    required CashierStatementParams params,
  });
  Future<List<CashierStatementCustomerModel>> cashierStatementGetCustomers({
    required CashierStatementParams params,
  });
}

class CashierStatementDataSourceImpl extends CashierStatementDataSource {
  CashierStatementDataSourceImpl({required super.httpClient});

  @override
  Future<List<CashierStatementModel>> cashierStatementGetByCustomer(
      {required CashierStatementParams params}) async {
    return await request(
      'financial/statement/getbycustomer/${params.tbInstitutionId}/${params.tbUserId}/${params.tbCustomerId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => CashierStatementModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CashierStatementModel>> cashierStatementGetByDay(
      {required CashierStatementParams params}) async {
    return await request(
      'financial/statement/getbyday/${params.tbInstitutionId}/${params.tbUserId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => CashierStatementModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CashierStatementModel>> cashierStatementGetByMonth(
      {required CashierStatementParams params}) async {
    return await request(
      'financial/statement/getbymonth/${params.tbInstitutionId}/${params.tbUserId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => CashierStatementModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CashierStatementCustomerModel>> cashierStatementGetCustomers(
      {required CashierStatementParams params}) async {
    return await request(
      'financial/customer/charged/getlist/${params.tbInstitutionId}/${params.tbUserId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => CashierStatementCustomerModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
