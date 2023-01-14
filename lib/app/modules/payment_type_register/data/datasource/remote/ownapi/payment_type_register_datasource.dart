import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:http/http.dart' as http;

abstract class PaymentTypeRegisterDataSource {
  Future<List<PaymentTypeModel>> getlist();
  Future<PaymentTypeModel> post({required PaymentTypeModel model});
  Future<PaymentTypeModel> put({required PaymentTypeModel model});
  Future<String> delete({required int id});
}

class PaymentTypeRegisterDataSourceImpl extends PaymentTypeRegisterDataSource {
  final client = http.Client();
  List<PaymentTypeModel> prices = [];
  var tbInstitutionId = 1;
  @override
  Future<List<PaymentTypeModel>> getlist() async {
    try {
      final uri =
          Uri.parse('${baseApiUrl}paymenttype/getlist/$tbInstitutionId');

      final response = await client.get(uri);

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
      final uri = Uri.parse('${baseApiUrl}paymenttype');

      final response = await client.post(
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
      final uri = Uri.parse('${baseApiUrl}paymenttype');

      final response = await client.put(
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
}
