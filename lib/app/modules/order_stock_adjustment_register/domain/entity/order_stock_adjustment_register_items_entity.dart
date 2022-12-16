// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderStockAdjustmentRegisterItemsEntity {
  int tbStockListId;
  int tbProductId;
  String nameProduct;
  int unitValue;
  int quantity;

  OrderStockAdjustmentRegisterItemsEntity({
    required this.tbStockListId,
    required this.tbProductId,
    required this.nameProduct,
    required this.unitValue,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_stock_list_id'] = tbStockListId;
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['unit_value'] = unitValue;
    data['quantity'] = quantity;

    return data;
  }
}
