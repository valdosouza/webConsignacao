import 'package:appweb/app/modules/order_stock_transfer_register/domain/entity/order_stock_transfer_register_items_entity.dart';

class OrderStockTransferRegisterItemsModel
    extends OrderStockTransferRegisterItemsEntity {
  OrderStockTransferRegisterItemsModel({
    int? id,
    int? tbProductId,
    String? nameProduct,
    double? quantity,
    String? updateStatus,
  }) : super(
          id: id ?? 0,
          tbProductId: tbProductId ?? 0,
          nameProduct: nameProduct ?? "",
          quantity: quantity ?? 0,
          updateStatus: updateStatus ?? "N",
        );

  factory OrderStockTransferRegisterItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderStockTransferRegisterItemsModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbProductId: json['tb_product_id'] is String
          ? int.parse(json['tb_product_id'])
          : json['tb_product_id'],
      nameProduct: json['description'] as String? ?? "",
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
      updateStatus: json['update_status'] is String
          ? int.parse(json['update_status'])
          : json['update_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['quantity'] = quantity;
    data['update_status'] = updateStatus;
    return data;
  }

  factory OrderStockTransferRegisterItemsModel.empty() {
    return OrderStockTransferRegisterItemsModel();
  }
}
