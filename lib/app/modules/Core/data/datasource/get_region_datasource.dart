import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';

abstract class GetRegionDatasource extends Gateway {
  GetRegionDatasource({required super.httpClient});

  Future<List<RegionModel>> getRegion();
}

class GetRegionDataSourceImpl extends GetRegionDatasource {
  List<RegionModel> list = [];

  GetRegionDataSourceImpl({required super.httpClient});
  @override
  Future<List<RegionModel>> getRegion() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}region/getlist/$tbInstitutionId');

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
