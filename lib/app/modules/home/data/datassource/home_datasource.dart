import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';

/// Throws a [ServerException] for all error codes.
abstract class HomeDatasource extends Gateway {
  HomeDatasource({required super.httpClient});

  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed({
    required String initialDate,
    required String finalDate,
    required String terminal,
  });
}

class HomeDatasourceImpl extends HomeDatasource {
  HomeDatasourceImpl({required super.httpClient});
  //List<HomeSalesPaymentTypeModel> homeSalesPaymentTypesModel = [];
  @override
  Future<List<HomeSalesPaymentTypeModel>> getFinancialClosed({
    required String initialDate,
    required String finalDate,
    required String terminal,
  }) async {
    final body = jsonEncode(
      <String, String>{
        'initialDate': initialDate,
        'finalDate': finalDate,
        'tb_institution_id': "0",
        'terminal': terminal,
      },
    );

    return await request(
      'financial/getClosed/',
      method: HTTPMethod.post,
      data: body,
      (payload) {
        final data = jsonDecode(payload);
        final List<HomeSalesPaymentTypeModel> homeSalesPaymentTypesModel =
            (data as List).map((json) {
          return HomeSalesPaymentTypeModel(
            paymentType: json['paymentType'].toString(),
            totalQtty: int.parse(json['totalQtty'].toString()),
            totalValue: double.parse(json['totalValue'].toString()),
          );
        }).toList();
        return homeSalesPaymentTypesModel;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
