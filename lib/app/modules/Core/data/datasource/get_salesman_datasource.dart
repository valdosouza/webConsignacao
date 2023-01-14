import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:http/http.dart' as http;

abstract class GetSalesmanDatasource {
  Future<List<SalesmanListModel>> getSalesman();
}

class GetSalesmanDataSourceImpl extends GetSalesmanDatasource {
  final client = http.Client();
  List<SalesmanListModel> list = [];
  var tbInstitutionId = 1;
  @override
  Future<List<SalesmanListModel>> getSalesman() async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}collaborator/getlist/$tbInstitutionId');

      final response = await client.get(uri);

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
