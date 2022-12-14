import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_items_entity.dart';

class OrderConsignmentSupplyingItemsModel
    extends OrderConsignmentSupplyingItemsEntity {
  OrderConsignmentSupplyingItemsModel({
    required int tbProductId,
    required String nameProduct,
    required int bonus,
    required int leftover,
    required int devoluttion,
    required int newConsignment,
    required int qtyConsigned,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          leftover: leftover,
          devoluttion: devoluttion,
          newConsignment: newConsignment,
          qtyConsigned: qtyConsigned,
        );

  factory OrderConsignmentSupplyingItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderConsignmentSupplyingItemsModel(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'],
      bonus: json['bonus'],
      leftover: json['leftover'],
      devoluttion: json['devoluttion'],
      newConsignment: json['new_consignment'],
      qtyConsigned: json['qty_consigned'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['bonus'] = bonus;
    data['leftover'] = leftover;
    data['devoluttion'] = devoluttion;
    data['new_consignment'] = newConsignment;
    data['qty_consigned'] = qtyConsigned;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderConsignmentSupplyingItemsModel &&
        other.tbProductId == tbProductId &&
        other.nameProduct == nameProduct &&
        other.bonus == bonus &&
        other.leftover == leftover &&
        other.devoluttion == devoluttion &&
        other.newConsignment == newConsignment &&
        other.qtyConsigned == qtyConsigned;
  }

  @override
  int get hashCode {
    return tbProductId.hashCode ^
        nameProduct.hashCode ^
        bonus.hashCode ^
        leftover.hashCode ^
        devoluttion.hashCode ^
        newConsignment.hashCode ^
        qtyConsigned.hashCode;
  }
}
