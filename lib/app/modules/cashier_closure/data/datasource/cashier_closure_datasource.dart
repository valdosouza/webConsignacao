import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';

abstract class CashierClosureDatasource extends Gateway {
  CashierClosureDatasource({required super.httpClient});

  Future<ClosureModel> getClosure({
    required String date,
  });

  Future<List<CashierClosurePreviouslyModel>> closurePreviously();
}

class CashierClosureDatasourceImpl extends CashierClosureDatasource {
  CashierClosureDatasourceImpl({required super.httpClient});
  var tbIntitutionId = 1;
  var tbUserId = 2;
  @override
  Future<ClosureModel> getClosure({
    required String date,
  }) async {
    String formattedDate = CustomDate.formatDateOut(date);
    return await request(
      'cashier/closure/get/$tbIntitutionId/$tbUserId/$formattedDate',
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
  Future<List<CashierClosurePreviouslyModel>> closurePreviously() async {
    return await request(
      'cashier/closure/getlist/$tbIntitutionId/$tbUserId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List)
            .map((e) => CashierClosurePreviouslyModel.fromJson(e))
            .toList();
        return model;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
