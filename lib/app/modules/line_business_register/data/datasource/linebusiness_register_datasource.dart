import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:flutter/foundation.dart';

abstract class LinebusinessRegisterDataSource extends Gateway {
  LinebusinessRegisterDataSource({required super.httpClient});

  Future<List<LinebusinessModel>> getlist();
  Future<LinebusinessModel> post({required LinebusinessModel model});
  Future<LinebusinessModel> put({required LinebusinessModel model});
  Future<String> delete({required int id});
}

class LinebusinessRegisterDataSourceImpl
    extends LinebusinessRegisterDataSource {
  List<LinebusinessModel> prices = [];

  LinebusinessRegisterDataSourceImpl({required super.httpClient});

  @override
  Future<List<LinebusinessModel>> getlist() async {
    try {
      String tbInstitutionId = '1';
      await getInstitutionId().then((value) {
        tbInstitutionId = value.toString();
      });

      final uri =
          Uri.parse('${baseApiUrl}linebusiness/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return LinebusinessModel.fromJson(json);
        }).toList();

        return prices;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LinebusinessModel> post({required LinebusinessModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });

      model.tbInstitutionId = tbInstitutionId;

      final uri = Uri.parse('${baseApiUrl}linebusiness');
      final response = await httpClient.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = LinebusinessModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<LinebusinessModel> put({required LinebusinessModel model}) async {
    try {
      int tbInstitutionId = 1;
      await getInstitutionId().then((value) {
        (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
      });

      model.tbInstitutionId = tbInstitutionId;
      final bodyContent = jsonEncode(model.toJson());
      final uri = Uri.parse('${baseApiUrl}linebusiness');
      final response = await httpClient.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyContent,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = LinebusinessModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}linebusiness/$id');

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
