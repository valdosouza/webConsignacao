class OrderStockAdjustmentRegisterItemsEntity {
  int id;
  int tbProductId;
  String nameProduct;
  double quantity;
  String updateStatus;
  OrderStockAdjustmentRegisterItemsEntity({
    required this.id,
    required this.tbProductId,
    required this.nameProduct,
    required this.quantity,
    required this.updateStatus,
  });
}
