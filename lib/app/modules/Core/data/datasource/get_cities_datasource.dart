import 'dart:convert';
import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:http/http.dart' as http;

abstract class GetCitiesDatasource {
  Future<List<CityModel>> getCities(int tbStaetId);
}

class GetCitiesDatasourceImpl implements GetCitiesDatasource {
  final client = http.Client();
  List<CityModel> citys = [];

  @override
  Future<List<CityModel>> getCities(int tbSateId) async {
    try {
      final uri = Uri.parse('${baseApiUrl}city/getlist/$tbSateId');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        citys = (obj as List).map((json) {
          return CityModel.fromJson(json);
        }).toList();
        return citys;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
