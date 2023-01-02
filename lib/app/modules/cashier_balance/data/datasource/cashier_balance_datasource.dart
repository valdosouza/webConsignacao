import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';

import 'package:http/http.dart' as http;

import '../../domain/entity/cashier_balance_entity.dart';
import '../model/cashier_balance_model.dart';

abstract class CashierBalanceDataSource {
  Future<CashierBalanceEntity> getCashierBalance(
      {required int id, required String date, required int userId});
}

class CashierBalanceDataSourceImpl extends CashierBalanceDataSource {
  final client = http.Client();

  @override
  Future<CashierBalanceEntity> getCashierBalance(
      {required int id, required String date, required int userId}) async {
    var data = {
      "date": "01/01/2023",
      "items": [
        {"description": "Dinheiro", "tag_value": "5.6"},
        {"description": "pix", "tag_value": "100"},
        {"description": "cartao", "tag_value": "60.00"},
      ]
    };
    return CashierBalanceModel.fromJson(data);
    try {
      var newDate = CashierBalanceModel.convertDate(date);
      final uri =
          Uri.parse('${baseApiUrl}cashier/balance/get/$id/$userId/$newDate');

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
