import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_items_entity.dart';

class OrderStockAdjustmentRegisterItemsModel
    extends OrderStockAdjustmentRegisterItemsEntity {
  OrderStockAdjustmentRegisterItemsModel({
    int? tbStockListId,
    int? tbProductId,
    String? nameProduct,
    int? unitValue,
    int? quantity,
  }) : super(
          tbStockListId: tbStockListId ?? 0,
          tbProductId: tbProductId ?? 0,
          nameProduct: nameProduct ?? "",
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
          nameProduct: json['name_product'] as String? ?? "",
      unitValue: json['unit_value'] is String
          ? int.parse(json['unit_value'])
          : json['unit_value'],
      quantity: json['quantity'] is String
          ? int.parse(json['quantity'])
          : json['quantity'],
    );
  }

  factory OrderStockAdjustmentRegisterItemsModel.empty() {
    return OrderStockAdjustmentRegisterItemsModel();
  }
}
