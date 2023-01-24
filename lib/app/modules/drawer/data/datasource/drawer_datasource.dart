import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';

abstract class DrawerDataSource extends Gateway {
  DrawerDataSource({required super.httpClient});

  Future<bool> cashierIsOpen();
}

class DrawerDataSourceImpl extends DrawerDataSource {
  DrawerDataSourceImpl({required super.httpClient});

  @override
  Future<bool> cashierIsOpen() async {
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
        return data['result'] as bool;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
