import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';

class OrderLoadCardMainEntity {
  OrderLoadCardMainEntity({
    int? id,
    int? tbInstitutionId,
    int? tbSalesmanId,
    String? nameSalesman,
    String? dtRecord,
    List<OrderLoadCardItemsModel>? items,
  });
}
