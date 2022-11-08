import 'dart:convert';
import 'package:appweb/app/modules/Core/data/model/address_model.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';

import 'package:http/http.dart' as http;

abstract class GetCepDatasource {
  Future<AddressModel> getCep(String cep);
}

class GetCepDatasourceImpl implements GetCepDatasource {
  final client = http.Client();

  @override
  Future<AddressModel> getCep(String cep) async {
    try {
      final uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //Pega o codigo da Cidade
        final cityCode = await getCityID(data.ibge);
        data.push({"tb_city_id": cityCode});
        //Pega o codigo do estado
        final stateCode = await getStateID(data.uf);
        data.push({"tb_state_id": stateCode});
        return AddressModel.fromApiCep(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<int> getCityID(String ibge) async {
    try {
      final uri = Uri.parse('{$baseApiUrl}get/$ibge');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data.id;
      } else {
        return 4004;
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<int> getStateID(String sigla) async {
    try {
      final uri = Uri.parse('{$baseApiUrl}state/get/$sigla');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data.id;
      } else {
        return 41;
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
