class OrderItemEntity {
  int id;
  int tbStockListId;
  String nameStockList;
  int tbProductId;
  String nameProduct;
  double unitValue;
  double quantity;
  String updateStatus;

  OrderItemEntity({
    this.id = 0,
    this.tbStockListId = 0,
    this.nameStockList = "",
    this.tbProductId = 0,
    this.nameProduct = "",
    this.unitValue = 0,
    this.quantity = 0,
    this.updateStatus = "N",
  });
}
