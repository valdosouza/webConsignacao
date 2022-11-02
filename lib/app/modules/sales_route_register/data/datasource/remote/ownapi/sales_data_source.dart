import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';

import '../../../../../../core/shared/constants.dart';
import '../../../models/sales_model.dart';
import 'package:http/http.dart' as http;

abstract class SalesDataSource {
  Future<SalesModel> post({required SalesModel model});
}

class SalesDataSourceImpl implements SalesDataSource {
  final client = http.Client();

  @override
  Future<SalesModel> post({required SalesModel model}) async {
    final uri = Uri.parse('${baseApiUrl}salesroute');
    try {
      final response = await client.post(uri, body: model.toJson());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        SalesModel result = SalesModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
