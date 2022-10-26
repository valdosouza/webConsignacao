import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:http/http.dart' as http;

/// Throws a [ServerException] for all error codes.
abstract class PaymentTypeDatasource {
  Future<List<PaymentTypeModel>> getlist({required int institutionId});
  Future<PaymentTypeModel> post({required PaymentTypeModel model});
  Future<String> put({required PaymentTypeModel model});
  Future<String> delete({required int id});
}

class PaymentTypeDatasourceImpl implements PaymentTypeDatasource {
  final client = http.Client();
  List<PaymentTypeModel> items = [];
  @override
  Future<List<PaymentTypeModel>> getlist({required int institutionId}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$institutionId');

      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return PaymentTypeModel.fromJson(json);
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
  Future<PaymentTypeModel> post({required PaymentTypeModel model}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');
    try {
      final response = await client.post(uri, body: model.toJson());

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        PaymentTypeModel result = PaymentTypeModel.fromJson(data);
        return result;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> put({required PaymentTypeModel model}) async {
    try {
      final uri = Uri.parse('${baseApiUrl}paymenttype');

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
