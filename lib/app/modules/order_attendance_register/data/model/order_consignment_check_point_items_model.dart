import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_items_entity.dart';

class OrderConsignmentCheckPointItemsModel
    extends OrderConsignmentCheckPointItemsEntity {
  OrderConsignmentCheckPointItemsModel({
    required int tbProductId,
    required String nameProduct,
    required int bonus,
    required int qtyConsigned,
    required int leftover,
    required int qtySold,
    required double unitValue,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          qtyConsigned: qtyConsigned,
          leftover: leftover,
          qtySold: qtySold,
          unitValue: unitValue,
        );

  factory OrderConsignmentCheckPointItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderConsignmentCheckPointItemsModel(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'],
      bonus: json['bonus'],
      qtyConsigned: json['qty_consigned'],
      leftover: json['leftover'],
      qtySold: json['qty_sold'],
      unitValue: json['unit_value'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['bonus'] = bonus;
    data['qty_consigned'] = qtyConsigned;
    data['leftover'] = leftover;
    data['qty_sold'] = qtySold;
    data['unit_value'] = unitValue;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderConsignmentCheckPointItemsModel &&
        other.tbProductId == tbProductId &&
        other.nameProduct == nameProduct &&
        other.bonus == bonus &&
        other.qtyConsigned == qtyConsigned &&
        other.leftover == leftover &&
        other.qtySold == qtySold &&
        other.unitValue == unitValue;
  }

  @override
  int get hashCode {
    return tbProductId.hashCode ^
        nameProduct.hashCode ^
        bonus.hashCode ^
        qtyConsigned.hashCode ^
        leftover.hashCode ^
        qtySold.hashCode ^
        unitValue.hashCode;
  }
}
