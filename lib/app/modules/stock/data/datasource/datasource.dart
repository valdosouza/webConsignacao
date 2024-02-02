import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';

abstract class DataSource extends Gateway {
  DataSource({required super.httpClient});

  Future<CashierStatusModel> cashierIsOpen();
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required super.httpClient});

  @override
  Future<CashierStatusModel> cashierIsOpen() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });
    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });

    return request(
      'cashier/isopen/$tbInstitutionId/$tbUserId',
      (payload) {
        final data = json.decode(payload);
        return CashierStatusModel.fromJson(data);
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
