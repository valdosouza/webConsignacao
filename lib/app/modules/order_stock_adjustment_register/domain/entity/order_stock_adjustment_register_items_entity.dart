// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderStockAdjustmentRegisterItemsEntity {
  int id;
  int tbInstitutionId;
  int tbOrderId;
  int tbStockListId;
  int tbProductId;
  String description;
  String nameStockList;
  double unitValue;
  double quantity;

  OrderStockAdjustmentRegisterItemsEntity({
    required this.id,
    required this.tbInstitutionId,
    required this.tbOrderId,
    required this.tbStockListId,
    required this.tbProductId,
    required this.description,
    required this.nameStockList,
    required this.unitValue,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
    data['tb_stock_list_id'] = tbStockListId;
    data['tb_product_id'] = tbProductId;
    data['description'] = description;
    data['name_stock_list'] = nameStockList;
    data['unit_value'] = unitValue;
    data['quantity'] = quantity;

    return data;
  }
}
