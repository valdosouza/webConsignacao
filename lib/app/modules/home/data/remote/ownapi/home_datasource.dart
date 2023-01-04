import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';

/// Calls the https://www.api.gestaosetes.com.br/financial/getClosed/ endpoint.
///
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
    final institution = await LocalStorageService.instance.get(
      key: LocalStorageKey.institution,
      defaultValue: 1223,
    );
    final body = jsonEncode(
      <String, String>{
        'initialDate': initialDate,
        'finalDate': finalDate,
        'institution': institution.toString(),
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
