import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:flutter/foundation.dart';

abstract class DataSource extends Gateway {
  DataSource({required super.httpClient});
  Future<List<SummaryModel>> get({
    required Params params,
  });

  Future<List<SalesmanModel>> getSalesmans();
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required super.httpClient});
  List<SummaryModel> summaryList = [];

  @override
  Future<List<SummaryModel>> get({required Params params}) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    params.tbInstitutionId = tbInstitutionId;

    return request(
      'cashierstatementsummary/get',
      method: HTTPMethod.post,
      data: jsonEncode(params.toJson()),
      timeout: const Duration(milliseconds: 50000),
      (payload) {
        final data = json.decode(payload);
        summaryList = (data as List).map(
          (json) {
            return SummaryModel.fromJson(json);
          },
        ).toList();
        return summaryList;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<SalesmanModel>> getSalesmans() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'salesman/getlist/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model =
            (data as List).map((e) => SalesmanModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
