import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';

abstract class GetSalesRouteDatasource extends Gateway {
  GetSalesRouteDatasource({required super.httpClient});

  Future<List<SalesRouteListModel>> getSalesRoute();
}

class GetSalesRouteDataSourceImpl extends GetSalesRouteDatasource {
  List<SalesRouteListModel> list = [];

  GetSalesRouteDataSourceImpl({required super.httpClient});
  @override
  Future<List<SalesRouteListModel>> getSalesRoute() async {
    try {
      final tbInstitutionId = await getInstitutionId();
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

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
