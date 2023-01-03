import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:http/http.dart' as http;
import '../model/cashier_balance_model.dart';

abstract class CashierBalanceDataSource {
  Future<CashierBalanceModel> cashierBalanceGet(
      {required int tbInstitutionId,
      required String date,
      required int tbUserId});
}

class CashierBalanceDataSourceImpl extends CashierBalanceDataSource {
  final client = http.Client();

  @override
  Future<CashierBalanceModel> cashierBalanceGet(
      {required int tbInstitutionId,
      required String date,
      required int tbUserId}) async {
    try {
      //var newDate = CashierBalanceModel.convertDate(date);
      var newDate = "2022-12-29";
      final uri = Uri.parse(
          '${baseApiUrl}cashier/balance/get/$tbInstitutionId/$tbUserId/$newDate');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = CashierBalanceModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
