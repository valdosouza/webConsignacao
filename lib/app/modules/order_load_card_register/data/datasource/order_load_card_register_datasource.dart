import 'dart:convert';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/gateway.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:flutter/foundation.dart';

abstract class OrderLoadCardRegisterDatasource extends Gateway {
  OrderLoadCardRegisterDatasource({required super.httpClient});

  Future<String> post({required OrderLoadCardMainModel model});

  Future<List<OrderLoadCardItemsModel>> getNewOrderLoadCard();
}

class OrderLoadCardRegisterDatasourceImpl
    extends OrderLoadCardRegisterDatasource {
  OrderLoadCardRegisterDatasourceImpl({required super.httpClient});

  @override
  Future<String> post({
    required OrderLoadCardMainModel model,
  }) async {
    int tbInstitutionId = 1;
    await getInstitutionId().then((value) {
      (kIsWeb) ? tbInstitutionId = value : tbInstitutionId = int.parse(value);
    });

    int tbUserId = 1;
    await getUserId().then((value) {
      (kIsWeb) ? tbUserId = value : tbUserId = int.parse(value);
    });

    model.tbInstitutionId = tbInstitutionId;
    model.tbUserId = tbUserId;

    final bodyEnvio = json.encode(model.toJson());

    return await request(
      'orderloadcard',
      data: bodyEnvio,
      method: HTTPMethod.post,
      (payload) {
        final data = json.decode(payload);
        return data['result'];
      },
      onError: (error) {
        return ServerException;
      },
    );
  }

  @override
  Future<List<OrderLoadCardItemsModel>> getNewOrderLoadCard() async {
    String tbInstitutionId = '1';
    await getInstitutionId().then((value) {
      tbInstitutionId = value.toString();
    });
    String tbSalesmanId = '1';
    await getUserId().then((value) {
      tbSalesmanId = value.toString();
    });
    var dtRecord = CustomDate.formatDateOut(CustomDate.newDate());
    return request(
      'orderloadcard/$tbInstitutionId/$tbSalesmanId/$dtRecord  ',
      (payload) {
        final obj = json.decode(payload);
        List<OrderLoadCardItemsModel> orderLoadCard = (obj as List).map((json) {
          return OrderLoadCardItemsModel.fromJson(json);
        }).toList();
        return orderLoadCard;
      },
      onError: (error) {
        return ServerException;
      },
    );
  }
}
