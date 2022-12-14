import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import '../model/cashier_balance_model.dart';

abstract class CashierBalanceDataSource extends Gateway {
  CashierBalanceDataSource({required super.httpClient});

  Future<CashierBalanceModel> cashierBalanceGet({
    required int tbInstitutionId,
    required String date,
    required int tbUserId,
  });
}

class CashierBalanceDataSourceImpl extends CashierBalanceDataSource {
  CashierBalanceDataSourceImpl({required super.httpClient});

  @override
  Future<CashierBalanceModel> cashierBalanceGet(
      {required int tbInstitutionId,
      required String date,
      required int tbUserId}) async {
    //var newDate = CashierBalanceModel.convertDate(date);
    var newDate = "2022-12-29";

    return await request(
      'cashier/balance/get/$tbInstitutionId/$tbUserId/$newDate',
      (payload) {
        final data = json.decode(payload);
        var model = CashierBalanceModel.fromJson(data);
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
