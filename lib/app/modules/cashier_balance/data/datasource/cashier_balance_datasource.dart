import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import '../model/cashier_balance_model.dart';

abstract class CashierBalanceDataSource extends Gateway {
  CashierBalanceDataSource({required super.httpClient});

  Future<CashierBalanceModel> cashierBalanceGet({required String date});
}

class CashierBalanceDataSourceImpl extends CashierBalanceDataSource {
  CashierBalanceDataSourceImpl({required super.httpClient});
  var tbInstitutionId = 1;
  @override
  Future<CashierBalanceModel> cashierBalanceGet({required String date}) async {
    var newDate = CustomDate.formatDateOut(date);

    return await request(
      'cashier/balance/get/$tbInstitutionId/2/$newDate',
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
