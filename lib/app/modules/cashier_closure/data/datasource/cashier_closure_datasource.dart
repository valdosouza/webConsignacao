import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract class CashierClosureDatasource extends Gateway {
  CashierClosureDatasource({required super.httpClient});

  Future<ClosureModel> getClosure({
    required int institutionId,
    required int userId,
    required DateTime date,
  });

  Future<List<CashierClosurePreviously>> closurePreviously({
    required int institutionId,
    required int userId,
  });
}

class CashierClosureDatasourceImpl extends CashierClosureDatasource {
  CashierClosureDatasourceImpl({required super.httpClient});

  @override
  Future<ClosureModel> getClosure({
    required int institutionId,
    required int userId,
    required DateTime date,
  }) async {
    initializeDateFormatting('pt_BR,', null);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return await request(
      'cashier/closure/get/$institutionId/$userId/$formattedDate',
      (payload) {
        final data = json.decode(payload);
        var currentClosure = ClosureModel.fromJson(data);

        return currentClosure;
      },
      onError: (error) {
        throw ServerException();
      },
    );
  }

  @override
  Future<List<CashierClosurePreviously>> closurePreviously({
    required int institutionId,
    required int userId,
  }) async {
    return await request(
      'cashier/closure/getlist/$institutionId/$userId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierClosurePreviously.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
