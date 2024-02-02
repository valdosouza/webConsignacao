import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';

abstract class DrawerDataSource extends Gateway {
  DrawerDataSource({required super.httpClient});

  Future<CashierStatusModel> cashierIsOpen();
  Future<OrderLoadCardMainModel> orderLoadExist();
}

class DrawerDataSourceImpl extends DrawerDataSource {
  DrawerDataSourceImpl({required super.httpClient});

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

  @override
  Future<OrderLoadCardMainModel> orderLoadExist() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });
    String tbUserId = '1';
    await getUserId().then((value) {
      tbUserId = value.toString();
    });
    String dtRecord = CustomDate.newDate();
    dtRecord = CustomDate.formatDateOut(dtRecord);
    return request(
      'orderloadcard/getByUserDate/$tbInstitutionId/$tbUserId/$dtRecord',
      (payload) {
        final data = json.decode(payload);
        return OrderLoadCardMainModel.fromJson(data);
      },
      onError: (error) {
        return Future.error(ServerException());
      },
    );
  }
}
