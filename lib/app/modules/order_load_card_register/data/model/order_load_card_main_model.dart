import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/entity/order_load_card_main_entity.dart';

class OrderLoadCardMainModel extends OrderLoadCardMainEntity {
  int id;
  int tbInstitutionId;
  int tbSalesmanId;
  String nameSalesman;
  String dtRecord;
  List<OrderLoadCardItemsModel> items;

  OrderLoadCardMainModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbSalesmanId,
    required this.nameSalesman,
    required this.dtRecord,
    required this.items,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbSalesmanId: tbSalesmanId,
          nameSalesman: nameSalesman,
          dtRecord: dtRecord,
          items: items,
        );

  factory OrderLoadCardMainModel.fromJson(Map<String, dynamic> json) {
    return OrderLoadCardMainModel(
      id: json['id'],
      tbInstitutionId: json['tb_institutioin_id'],
      tbSalesmanId: json['tb_salesman_id'],
      nameSalesman: json['name_salesman'],
      dtRecord: json['dt_record'],
      items: (json['Items'] as List)
          .map((e) => OrderLoadCardItemsModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_salesman_id'] = tbSalesmanId;
    data['name_salesman'] = nameSalesman;
    data['dt_record'] = dtRecord;
    data['Items'] = items.map((i) => i.toJson()).toList();

    return data;
  }

  factory OrderLoadCardMainModel.isEmpty() {
    return OrderLoadCardMainModel(
      id: 0,
      tbInstitutionId: 0,
      tbSalesmanId: 0,
      nameSalesman: "",
      dtRecord: CustomDate.newDate(),
      items: [],
    );
  }
}
