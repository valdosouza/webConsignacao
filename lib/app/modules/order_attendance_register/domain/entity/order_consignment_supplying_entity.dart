import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_items_entity.dart';

class OrderConsignmentSupplyingEntity{
  int tbInstitutionId;
  int tbOrderId;
  List<OrderConsignmentSupplyingItemsEntity> items;

  OrderConsignmentSupplyingEntity({
    this.tbInstitutionId = 0,
    this.tbOrderId = 0,
    this.items = const [],
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
    data['items'] = items.map((v) => v.toJson()).toList();
    return data;
  }

  factory OrderConsignmentSupplyingEntity.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentSupplyingEntity(
      tbInstitutionId: json['tb_institution_id'],
      tbOrderId: json['tb_order_id'],
      items: (json['items'] as List<dynamic>).map((e) => OrderConsignmentSupplyingItemsEntity.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}