import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:flutter/foundation.dart';

abstract class GetRegionBySalesmanDatasource extends Gateway {
  GetRegionBySalesmanDatasource({required super.httpClient});

  Future<List<RegionModel>> getList();
}

class GetRegionBySalesmanDataSourceImpl extends GetRegionBySalesmanDatasource {
  List<RegionModel> list = [];

  GetRegionBySalesmanDataSourceImpl({required super.httpClient});
  @override
  Future<List<RegionModel>> getList() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      String tbSalesmanId = '0';
      if (!kIsWeb) {
        await getUserId().then((value) {
          tbSalesmanId = value.toString();
        });
      }
      final uri = Uri.parse(
          '${baseApiUrl}region/salesman/getlist/$tbInstitutionId/$tbSalesmanId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        list = (obj as List).map((json) {
          return RegionModel.fromJson(json);
        }).toList();
        return list;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
