import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/region_register/data/model/region_model.dart';
import 'package:flutter/foundation.dart';

abstract class RegionRegisterDataSource extends Gateway {
  RegionRegisterDataSource({required super.httpClient});

  Future<List<RegionRegisterModel>> getlist();
  Future<RegionRegisterModel> post({required RegionRegisterModel model});
  Future<RegionRegisterModel> put({required RegionRegisterModel model});
  Future<String> delete({required int id});
}

class RegionRegisterDataSourceImpl extends RegionRegisterDataSource {
  List<RegionRegisterModel> list = [];

  RegionRegisterDataSourceImpl({required super.httpClient});
  @override
  Future<List<RegionRegisterModel>> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri = Uri.parse('${baseApiUrl}Region/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        list = (data as List).map((json) {
          return RegionRegisterModel.fromJson(json);
        }).toList();

        return list;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<RegionRegisterModel> post({required RegionRegisterModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;

      final uri = Uri.parse('${baseApiUrl}Region');

      final response = await httpClient.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = RegionRegisterModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<RegionRegisterModel> put({required RegionRegisterModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });
      model.tbInstitutionId = tbInstitutionId;
      final uri = Uri.parse('${baseApiUrl}Region');
      final bodyContent = jsonEncode(model.toJson());
      final response = await httpClient.put(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: bodyContent);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        var model = RegionRegisterModel.fromJson(data);
        return model;
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
      final uri = Uri.parse('${baseApiUrl}Region/$id');

      final response = await httpClient.delete(uri);

      if (response.statusCode == 200) {
        return "";
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
