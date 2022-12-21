import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:http/http.dart' as http;

abstract class SalesRouteDataSource {
  Future<List<SalesRouteListModel>> getlist({required int institutionId});
}

class SalesRouteDataSourceImpl extends SalesRouteDataSource {
  final client = http.Client();
  List<SalesRouteListModel> salesroutes = [];

  @override
  Future<List<SalesRouteListModel>> getlist(
      {required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}salesroute/getlist/$institutionId');

      final response = await client.get(uri);

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
