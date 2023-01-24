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

  @override
  Future<CashierBalanceModel> cashierBalanceGet({required String date}) async {
    var newDate = CustomDate.formatDateOut(date);
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
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
