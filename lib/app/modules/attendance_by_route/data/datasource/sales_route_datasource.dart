import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';

abstract class SalesRouteDataSource extends Gateway {
  SalesRouteDataSource({required super.httpClient});
  Future<List<SalesRouteListModel>> getlist();
}

class SalesRouteDataSourceImpl extends SalesRouteDataSource {
  List<SalesRouteListModel> salesroutes = [];

  SalesRouteDataSourceImpl({required super.httpClient});
  @override
  Future<List<SalesRouteListModel>> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        salesroutes = (data as List).map((json) {
          return SalesRouteListModel.fromJson(json);
        }).toList();

        return salesroutes;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
