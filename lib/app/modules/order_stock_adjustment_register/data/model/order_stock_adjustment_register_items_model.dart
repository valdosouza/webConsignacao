import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_items_entity.dart';

class OrderStockAdjustmentRegisterItemsModel
    extends OrderStockAdjustmentRegisterItemsEntity {
  OrderStockAdjustmentRegisterItemsModel({
    int? tbStockListId,
    int? tbProductId,
    String? description,
    String? nameStockList,
    int? unitValue,
    double? quantity,
  }) : super(
          tbStockListId: tbStockListId ?? 0,
          tbProductId: tbProductId ?? 0,
          description: description ?? "",
          nameStockList: nameStockList ?? "",
          unitValue: unitValue ?? 0,
          quantity: quantity ?? 0,
        );

  factory OrderStockAdjustmentRegisterItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderStockAdjustmentRegisterItemsModel(
      tbStockListId: json['tb_stock_list_id'] is String
          ? int.parse(json['tb_stock_list_id'])
          : json['tb_stock_list_id'],
      tbProductId: json['tb_product_id'] is String
          ? int.parse(json['tb_product_id'])
          : json['tb_product_id'],
          description: json['name_product'] as String? ?? "",
          nameStockList: json['name_stock_list'] as String? ?? "",
      unitValue: json['unit_value'] is String
          ? int.parse(json['unit_value'])
          : json['unit_value'],
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
    );
  }

  factory OrderStockAdjustmentRegisterItemsModel.empty() {
    return OrderStockAdjustmentRegisterItemsModel();
  }
}
