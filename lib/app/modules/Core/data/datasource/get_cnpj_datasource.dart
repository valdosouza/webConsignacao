import 'dart:convert';
import 'package:appweb/app/core/shared/constants.dart';
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
      final response = await client.get(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        uri,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //Pega o codigo da Cidade
        final cityCode = await getCityID(data['uf'], data['municipio']);
        data['tb_city_id'] = cityCode;
        //Pega o codigo do estado
        final stateCode = await getStateID(data['uf']);
        data['tb_state_id'] = stateCode;
        return IdentificationCompanyModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<int> getCityID(String stateSigla, String nameCity) async {
    try {
      final uri = Uri.parse('${baseApiUrl}city/get/$stateSigla/$nameCity');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['id'];
      } else {
        return 4004;
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<int> getStateID(String sigla) async {
    try {
      final uri = Uri.parse('${baseApiUrl}state/get/$sigla');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['id'];
      } else {
        return 41;
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
