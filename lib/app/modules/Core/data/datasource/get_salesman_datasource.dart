import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';

abstract class GetSalesmanDatasource extends Gateway {
  GetSalesmanDatasource({required super.httpClient});

  Future<List<SalesmanListModel>> getSalesman();
}

class GetSalesmanDataSourceImpl extends GetSalesmanDatasource {
  List<SalesmanListModel> list = [];

  GetSalesmanDataSourceImpl({required super.httpClient});
  @override
  Future<List<SalesmanListModel>> getSalesman() async {
    try {
      var tbInstitutionId = getInstitutionId();
      final uri =
          Uri.parse('${baseApiUrl}collaborator/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        list = (obj as List).map((json) {
          return SalesmanListModel.fromJson(json);
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
