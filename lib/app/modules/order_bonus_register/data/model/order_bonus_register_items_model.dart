import 'package:appweb/app/modules/order_bonus_register/domain/entity/order_bonus_register_items_entity.dart';

class OrderBonusRegisterItemsModel extends OrderBonusRegisterItemsEntity {
  OrderBonusRegisterItemsModel({
    int? id,
    int? tbInstitutionId,
    int? tbOrderId,
    int? tbStockListId,
    int? tbProductId,
    String? description,
    String? nameStockList,
    double? unitValue,
    double? quantity,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbOrderId: tbOrderId ?? 0,
          tbStockListId: tbStockListId ?? 0,
          tbProductId: tbProductId ?? 0,
          description: description ?? "",
          nameStockList: nameStockList ?? "",
          unitValue: unitValue ?? 0,
          quantity: quantity ?? 0,
        );

  factory OrderBonusRegisterItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderBonusRegisterItemsModel(
      tbStockListId: json['tb_stock_list_id'],
      tbProductId: json['tb_product_id'],
      description: json['description'] as String? ?? "",
      nameStockList: json['name_stock_list'] as String? ?? "",
      unitValue: json['unit_value'] is String
          ? double.parse(json['unit_value'])
          : json['unit_value'],
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
    );
  }

  factory OrderBonusRegisterItemsModel.empty() {
    return OrderBonusRegisterItemsModel();
  }
}
