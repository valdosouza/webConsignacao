import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/company_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:http/http.dart' as http;

abstract class CollaboratorRegisterDatasource {
  Future<CollaboratorModel> getCollaborator({required int id});
  Future<CollaboratorModel> postCollaborator({required CollaboratorModel model});
  Future<String> putCollaborator({required CollaboratorModel model});
  Future<String> deleteCollaborator({required int id});
  Future<AddressModel> getCep(String cep);
  Future<CollaboratorModel> getCnpj(String cnpj);
  Future<List<StateModel>> getStates();
  Future<List<CityModel>> getCitys(String id);
  Future<List<LineBusinessModel>> getLineBusiness({required int institution});
  Future<List<CollaboratorModel>> getlistCollaborator({required int institution});
}

class CollaboratorRegisterDatasourceImpl
    implements CollaboratorRegisterDatasource {
  final client = http.Client();
  List<StateModel> states = [];
  List<CityModel> citys = [];
  @override
  Future<CollaboratorModel> getCollaborator({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator/$id');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CollaboratorModel.fromMap(data) ;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CollaboratorModel> postCollaborator(
      {required CollaboratorModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator/');
      final response = await client.post(uri, body: model.toJson());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CollaboratorModel.fromMap(data as Map<String, dynamic>);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> putCollaborator({required CollaboratorModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}collaborator');
      final response = await client.post(uri, body: model.toJson());
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
  Future<String> deleteCollaborator({required int id}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}Collaborator/$id');
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
        return AddressModel.fromMapRemoteAPI(jsonDecode(response.body));
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<CollaboratorModel> getCnpj(String cnpj) async {
    try {
      final uri = Uri.parse('https://www.receitaws.com.br/v1/cnpj/$cnpj', );
      final response = await client.get(uri);      
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        CompanyModel companyModel = CompanyModel.fromJsonRemoteAPI(obj);
        AddressModel addressModel = AddressModel.fromJsonRemoteAPI(obj);
        return CollaboratorModel(company: companyModel, address: addressModel);
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
  Future<List<LineBusinessModel>> getLineBusiness({required int institution}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}linebusiness/getlist/$institution');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        List<LineBusinessModel> lineBusiness = (obj as List).map((json) {
          return LineBusinessModel.fromJson(json);
        }).toList();
        return lineBusiness;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
  
  @override
  Future<List<CollaboratorModel>> getlistCollaborator({required int institution}) async {
       try {
      final uri = Uri.parse('${baseApiUrl}collaborator/getlist/$institution');
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final obj = json.decode(response.body);
        List<CollaboratorModel> collaborators = (obj as List).map((json) {
          return CollaboratorModel.fromAPI(json);
        }).toList();
        return collaborators;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
