import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';

abstract class CashierClosureDatasource extends Gateway {
  CashierClosureDatasource({required super.httpClient});

  Future<ClosureModel> getClosure({required String date});

  Future<List<CashierClosurePreviouslyModel>> closurePreviously();

  Future<ClosureModel> postClosure({required ParamsCashierClosurePost param});
}

class CashierClosureDatasourceImpl extends CashierClosureDatasource {
  CashierClosureDatasourceImpl({required super.httpClient});

  @override
  Future<ClosureModel> getClosure({
    required String date,
  }) async {
    String formattedDate = CustomDate.formatDateOut(date);
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
    return await request(
      'cashier/closure/get/$tbInstitutionId/$tbUserId/$formattedDate',
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
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });

    return await request(
      'cashier/closure/getlist/$tbInstitutionId/$tbUserId',
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

  @override
  Future<ClosureModel> postClosure(
      {required ParamsCashierClosurePost param}) async {
    String formattedDate = CustomDate.newDate();
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
    return await request(
      'cashier/closure/get/$tbInstitutionId/$tbUserId/$formattedDate',
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
}
