import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/institution_register/data/model/address_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/identification_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:http/http.dart' as http;

abstract class InstitutionRegisterDatasource {
  Future<InstitutionModel> get({required int id});
  Future<InstitutionModel> post({required InstitutionModel model});
  Future<String> put({required InstitutionModel model});
  Future<String> delete({required int id});
  Future<AddressModel> getCep(String cep);
  Future<IdentificationModel> getCnpj(String cnpj);
  Future<List<StateModel>> getStates();
  Future<List<CityModel>> getCitys(String id);
}

class InstitutionRegisterDatasourceImpl
    implements InstitutionRegisterDatasource {
  final client = http.Client();
  List<StateModel> states = [];
  List<CityModel> citys = [];
  @override
  Future<InstitutionModel> get({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}institution/$id');
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return InstitutionModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<InstitutionModel> post({required InstitutionModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/');
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: model.toJson(),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return InstitutionModel.fromJson(data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required InstitutionModel model}) async {
    try {
      final int id = model.id;
      final uri = Uri.parse('${baseApiUrl}Institution/$id');
      final response = await client.put(uri, body: model.toJson());
      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> delete({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Institution/$id');
      final response = await client.delete(uri);
      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<AddressModel> getCep(String cep) async {
    try {
      final uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return AddressModel.fromJson(jsonDecode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<IdentificationModel> getCnpj(String cnpj) async {
    try {
      final uri = Uri.parse('https://www.receitaws.com.br/v1/cnpj/$cnpj');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        return IdentificationModel.fromJson(obj);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CityModel>> getCitys(String id) async {
    try {
      final uri = Uri.parse('${baseApiUrl}city/getlist/$id');
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

  @override
  Future<List<StateModel>> getStates() async {
    try {
      final uri = Uri.parse('${baseApiUrl}state/getlist/');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        states = (obj as List).map((json) {
          return StateModel.fromJson(json);
        }).toList();
        return states;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
