import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_supplying_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';

class OrderConsignmentSupplyingModel extends OrderConsignmentSupplyingEntity {
  OrderConsignmentSupplyingModel({
    required int tbInstitutionId,
    required int tbOrderId,
    required List<OrderConsignmentSupplyingItemsModel> items,
  }) : super(
          tbInstitutionId: tbInstitutionId,
          tbOrderId: tbOrderId,
          items: items,
        );

  factory OrderConsignmentSupplyingModel.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentSupplyingModel(
      tbInstitutionId: json['tb_institution_id'],
      tbOrderId: json['tb_order_id'],
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderConsignmentSupplyingItemsModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
    data['items'] = items.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderConsignmentSupplyingModel &&
        other.tbInstitutionId == tbInstitutionId &&
        other.tbOrderId == tbOrderId &&
        other.items == items;
  }

  @override
  int get hashCode {
    return tbInstitutionId.hashCode ^ tbOrderId.hashCode ^ items.hashCode;
  }
}
