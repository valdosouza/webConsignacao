class OrderConsignmentCheckPointItemsEntity{
  int tbProductId;
  String nameProduct;
  int bonus;
  int qtyConsigned;
  int leftover;
  int qtySold;
  double unitValue;

  OrderConsignmentCheckPointItemsEntity({
    this.tbProductId = 0,
    this.nameProduct = '',
    this.bonus = 0,
    this.qtyConsigned = 0,
    this.leftover = 0,
    this.qtySold = 0,
    this.unitValue = 0.0,
  });


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

  factory OrderConsignmentCheckPointItemsEntity.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckPointItemsEntity(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'],
      bonus: json['bonus'],
      qtyConsigned: json['qty_consigned'],
      leftover: json['leftover'],
      qtySold: json['qty_sold'],
      unitValue: json['unit_value'],
    );
  }
}