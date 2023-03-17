import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_salesman_model.dart';

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
  Future<List<CashierStatementModel>> cashierStatementGetByOrder({
    required CashierStatementParams params,
  });
  Future<List<CashierStatementCustomerModel>> cashierStatementGetCustomers({
    required CashierStatementParams params,
  });
  Future<List<CashierStatementSalesmanModel>> cashierStatementGetSalesmans({
    required CashierStatementParams params,
  });
}

class CashierStatementDataSourceImpl extends CashierStatementDataSource {
  CashierStatementDataSourceImpl({required super.httpClient});

  @override
  Future<List<CashierStatementModel>> cashierStatementGetByCustomer(
      {required CashierStatementParams params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    if (params.tbSalesmanId == 0) {
      await getUserId().then((value) {
        tbUserId = value.toString();
      });
    } else {
      tbUserId = params.tbSalesmanId.toString();
    }

    return await request(
      'financial/statement/getbycustomer/$tbInstitutionId/$tbUserId/${params.tbCustomerId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CashierStatementModel>> cashierStatementGetByOrder(
      {required CashierStatementParams params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });

    return await request(
      'financial/statement/getbyorder/$tbInstitutionId/$tbUserId/${params.tbOrderId}/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementModel.fromJson(e))
            .toList();
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
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
    return await request(
      'financial/statement/getbyday/$tbInstitutionId/$tbUserId/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementModel.fromJson(e))
            .toList();
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
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
    return await request(
      'financial/statement/getbymonth/$tbInstitutionId/$tbUserId/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementModel.fromJson(e))
            .toList();
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
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    //Se não for passado por parametro pegara o Usuario logado
    if (params.tbSalesmanId == 0) {
      await getUserId().then((value) {
        tbUserId = value.toString();
      });
    } else {
      tbUserId = params.tbSalesmanId.toString();
    }
    return await request(
      'financial/customer/charged/getlist/$tbInstitutionId/$tbUserId/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementCustomerModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<CashierStatementSalesmanModel>> cashierStatementGetSalesmans(
      {required CashierStatementParams params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'financial/salesman/customer/charged/getlist/$tbInstitutionId/${params.date}',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierStatementSalesmanModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
