import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';

abstract class CustomerDataSource extends Gateway {
  CustomerDataSource({required super.httpClient});

  Future<List<RegionRegisterModel>> getlistRegion();
}

class CustomerDataSourceImpl extends CustomerDataSource {
  List<RegionRegisterModel> list = [];

  CustomerDataSourceImpl({required super.httpClient});

  @override
  Future<List<RegionRegisterModel>> getlistRegion() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });
      String tbSalesmanId = '2';
      await getUserId().then((value) {
        tbSalesmanId = value.toString();
      });

      final uri = Uri.parse(
          '${baseApiUrl}region/salesman/getlist/$tbInstitutionId/$tbSalesmanId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        list = (data as List).map((json) {
          return RegionRegisterModel.fromJson(json);
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
