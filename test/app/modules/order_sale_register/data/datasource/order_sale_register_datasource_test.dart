import 'dart:io';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/order_sale_register/data/datasource/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ThrowingClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw const SocketException('No connection');
  }
}

class TestOrderSaleRegisterDatasource extends OrderSaleRegisterDatasourceImpl {
  TestOrderSaleRegisterDatasource({required super.httpClient});

  @override
  Future<String> getToken() async => '';

  @override
  Future getInstitutionId() async => '1';

  @override
  Future getUserId() async => '1';
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
  });

  test('post throws ServerException when request fails', () async {
    final datasource = TestOrderSaleRegisterDatasource(
      httpClient: ThrowingClient(),
    );
    final model = OrderSaleMainCardModel.isEmpty();

    await expectLater(
      datasource.post(model: model),
      throwsA(isA<ServerException>()),
    );
  });
}
