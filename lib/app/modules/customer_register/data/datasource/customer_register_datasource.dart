import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_salesman_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/address_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/identification_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:http/http.dart' as http;

abstract class CustomerRegisterDataSource {
  Future<List<CustomerListModel>> getList({required int id});
  Future<CustomerMainModel> get({required int id});
  Future<CustomerMainModel> post({required CustomerMainModel customer});
  Future<List<CustomerSalesmanModel>> getSalesmans({required int id});
  Future<AddressModel> getCep(String cep);
  Future<IdentificationModel> getCnpj(String cnpj);
  Future<List<StateModel>> getStates();
  Future<List<CityModel>> getCitys(String id);
}

class CustomerRegisterDataSourceImpl extends CustomerRegisterDataSource {
  final client = http.Client();
  List<CustomerListModel> items = [];
  List<StateModel> states = [];
  List<CityModel> citys = [];
  List<CustomerSalesmanModel> salesmans = [];

  @override
  Future<List<CustomerListModel>> getList({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        items = (data as List).map((json) {
          return CustomerListModel.fromJson(json);
        }).toList();

        return items;
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

  @override
  Future<CustomerMainModel> get({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = CustomerMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CustomerMainModel> post({required CustomerMainModel customer}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}customer');

      var bodyCustomer = jsonEncode(customer.toJson());
      final response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyCustomer,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = CustomerMainModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<CustomerSalesmanModel>> getSalesmans({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator/getlist/$id');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        salesmans = (obj as List).map((json) {
          return CustomerSalesmanModel.fromJson(json);
        }).toList();
        return salesmans;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
