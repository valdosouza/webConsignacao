import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:http/http.dart' as http;

abstract class GetSalesRouteDatasource {
  Future<List<SalesRouteListModel>> getSalesRoute();
}

class GetSalesRouteDataSourceImpl extends GetSalesRouteDatasource {
  final client = http.Client();
  List<SalesRouteListModel> list = [];
  var tbInstitutionId = 1;
  @override
  Future<List<SalesRouteListModel>> getSalesRoute() async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$tbInstitutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        list = (obj as List).map((json) {
          return SalesRouteListModel.fromJson(json);
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
