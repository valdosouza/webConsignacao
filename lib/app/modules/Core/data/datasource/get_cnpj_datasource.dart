import 'dart:convert';
import 'package:appweb/app/modules/Core/data/model/identification_company_model.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class GetCnpjDatasource {
  Future<IdentificationCompanyModel> getCnpj(String cnpj);
}

class GetCnpjDatasourceImpl implements GetCnpjDatasource {
  final client = http.Client();

  @override
  Future<IdentificationCompanyModel> getCnpj(String cnpj) async {
    try {
      final uri = Uri.parse('https://www.receitaws.com.br/v1/cnpj/$cnpj');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        return IdentificationCompanyModel.fromJson(obj);
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
