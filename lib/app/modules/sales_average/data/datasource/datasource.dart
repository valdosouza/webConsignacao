import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/sales_average/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';
import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';

abstract class DataSource extends Gateway {
  DataSource({required super.httpClient});

  Future<List<SalesAverageModel>> getSalesAverage({
    required ParamsGetSales params,
  });

  Future<List<RegionModel>> getRegion();
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required super.httpClient});

  @override
  Future<List<SalesAverageModel>> getSalesAverage(
      {required ParamsGetSales params}) async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'financial/statement/getbyday/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model =
            (data as List).map((e) => SalesAverageModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }

  @override
  Future<List<RegionModel>> getRegion() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });

    return await request(
      'financial/statement/getbyday/$tbInstitutionId',
      (payload) {
        final data = json.decode(payload);
        var model = (data as List).map((e) => RegionModel.fromJson(e)).toList();
        return model;
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
