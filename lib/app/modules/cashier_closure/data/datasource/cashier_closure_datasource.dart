import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';
import 'package:flutter/foundation.dart';

abstract class CashierClosureDatasource extends Gateway {
  CashierClosureDatasource({required super.httpClient});

  Future<ClosureModel> getClosure({required String date});

  Future<List<CashierClosurePreviouslyModel>> closurePreviously();

  Future<String> postClosure({required ParamsCashierClosurePost param});

  Future<ClosureModel> getForClosure({required String date});
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
  Future<ClosureModel> getForClosure({
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
      'cashier/closure/getforclosure/$tbInstitutionId/$tbUserId/$formattedDate',
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
  Future<String> postClosure({required ParamsCashierClosurePost param}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });
    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });
    param.model.tbInstitutionId = tbInstitutionId;
    param.model.tbUserId = tbUserId;
    final bodyContent = json.encode(param.model.toJson());

    return await request(
      'cashier/closure',
      data: bodyContent,
      method: HTTPMethod.post,
      (payload) {
        return payload;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
