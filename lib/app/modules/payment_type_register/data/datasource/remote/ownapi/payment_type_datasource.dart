import 'dart:convert';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';
import 'package:http/http.dart' as http;

abstract class PaymentTypeDataSource {
  Future<List<PaymentTypeModel>> getlist({required String idInstitution});
  Future<String> postPaymentType({required PaymentTypeModel paymentModel});
  Future<String> deletePaymentType({required int paymentId});
  Future<String> putPaymentType({required PaymentTypeModel paymentTypeModel});
}

class PaymentTypeDataSourceImpl implements PaymentTypeDataSource {
  final client = http.Client();
  List<PaymentTypeModel> items = [];
  @override
  Future<List<PaymentTypeModel>> getlist(
      {required String idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$idInstitution');

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        items = (data as List).map((json) {
          return PaymentTypeModel.fromJson(json);
        }).toList();
        return items;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> postPaymentType(
      {required PaymentTypeModel paymentModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');
    final body = {
      "tb_institution_id": paymentModel.idInstitution.toString(),
      "description": paymentModel.description.toUpperCase(),
      "active": paymentModel.active ? 'S' : 'N'
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
  Future<String> deletePaymentType({required int paymentId}) async {
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
  Future<String> putPaymentType(
      {required PaymentTypeModel paymentTypeModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');

    try {
      final response = await client.put(uri, body: paymentTypeModel.toMap());

      if (response.statusCode == 200) {
        return "";
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
