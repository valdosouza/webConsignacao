import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/shared/constants.dart';
import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:http/http.dart' as http;

abstract class PaymentDataSource {
  Future<List<PaymentModel>> getlist({required int idInstitution});
  Future<bool> postItem(
      {required String description, required int idInstitution});
  Future<bool> deleteItem({required PaymentModel paymentModel});
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final client = http.Client();
  List<PaymentModel> items = [];
  @override
  Future<List<PaymentModel>> getlist({required int idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/getlist/$idInstitution');

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      items = (data as List).map((json) {
        return PaymentModel.fromJson(json);
      }).toList();
      return items;
    }
    throw ServerException();
  }

  @override
  Future<bool> postItem(
      {required String description, required int idInstitution}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype');
    final json = {
      "tb_institution_id": idInstitution.toString(),
      "description": description.toUpperCase(),
      "active": 'S'
    };

    final response = await client.post(uri, body: json);

    if (response.statusCode == 201) {
      return true;
    }
    throw ServerException();
  }

  @override
  Future<bool> deleteItem({required PaymentModel paymentModel}) async {
    final uri = Uri.parse('${baseApiUrl}paymenttype/${paymentModel.id}');

    final response = await client.delete(uri);

    if (response.statusCode == 200) {
      return true;
    }
    throw ServerException();
  }
}
