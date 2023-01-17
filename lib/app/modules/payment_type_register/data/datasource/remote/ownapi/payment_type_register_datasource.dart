import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';

abstract class PaymentTypeRegisterDataSource extends Gateway {
  PaymentTypeRegisterDataSource({required super.httpClient});

  Future<List<PaymentTypeModel>> getlist();
  Future<PaymentTypeModel> post({required PaymentTypeModel model});
  Future<PaymentTypeModel> put({required PaymentTypeModel model});
  Future<String> delete({required int id});
}

class PaymentTypeRegisterDataSourceImpl extends PaymentTypeRegisterDataSource {
  List<PaymentTypeModel> prices = [];

  PaymentTypeRegisterDataSourceImpl({required super.httpClient});
  @override
  Future<List<PaymentTypeModel>> getlist() async {
    try {
      var tbInstitutionId = getInstitutionId();

      final uri =
          Uri.parse('${baseApiUrl}paymenttype/getlist/$tbInstitutionId');

      final response = await httpClient.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        prices = (data as List).map((json) {
          return PaymentTypeModel.fromJson(json);
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
  Future<PaymentTypeModel> post({required PaymentTypeModel model}) async {
    try {
      var tbInstitutionId = getInstitutionId();

      model.tbInstitutionId = tbInstitutionId as int;

      final uri = Uri.parse('${baseApiUrl}paymenttype');

      final response = await httpClient.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PaymentTypeModel.fromJson(data);
        return model;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PaymentTypeModel> put({required PaymentTypeModel model}) async {
    try {
      var tbInstitutionId = getInstitutionId();

      model.tbInstitutionId = tbInstitutionId as int;

      final uri = Uri.parse('${baseApiUrl}paymenttype');

      final response = await httpClient.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var model = PaymentTypeModel.fromJson(data);
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
      final uri = Uri.parse('${baseApiUrl}paymenttype/$id');

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
