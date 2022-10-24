import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:http/http.dart' as http;

abstract class PaymentDataSource {
  Future<List<PaymentModel>> getlist({required String idInstitution});
  Future<String> postPayment(
      {required String description, required int idInstitution});
  Future<String> deletePayment({required int paymentId});
  Future<String> putPayment({required PaymentModel paymentModel});
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final client = http.Client();
  List<PaymentModel> items = [];
  @override
  Future<List<PaymentModel>> getlist({required String idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$idInstitution');

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return PaymentModel.fromJson(json);
        }).toList();
        return items;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> postPayment(
      {required String description, required int idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');
    final body = {
      "tb_institution_id": idInstitution.toString(),
      "description": description.toUpperCase(),
      "active": 'S'
    };

    try {
      final response = await client.post(uri, body: body);

      if (response.statusCode == 200) {
        return '';
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> deletePayment({required int paymentId}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/$paymentId');

    try {
      final response = await client.delete(uri);

      if (response.statusCode == 200) {
        return "";
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> putPayment({required PaymentModel paymentModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');

    try {
      final response = await client.put(uri, body: paymentModel.toMap());

      if (response.statusCode == 200) {
        return "";
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
