class OrderConsignmentSupplyingItemsEntity{
  int tbProductId;
  String nameProduct;
  int bonus;
  int leftover;
  int devoluttion;
  int newConsignment;
  int qtyConsigned;

  OrderConsignmentSupplyingItemsEntity({
    this.tbProductId = 0,
    this.nameProduct = '',
    this.bonus = 0,
    this.leftover = 0,
    this.devoluttion = 0,
    this.newConsignment = 0,
    this.qtyConsigned = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['bonus'] = bonus;
    data['leftover'] = leftover;
    data['devoluttion'] = devoluttion;
    data['new_consignment'] = newConsignment;
    data['qty_consigned'] = qtyConsigned;
    return data;
  }

  factory OrderConsignmentSupplyingItemsEntity.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentSupplyingItemsEntity(
      tbProductId: json['tb_product_id'],
      nameProduct: json['name_product'],
      bonus: json['bonus'],
      leftover: json['leftover'],
      devoluttion: json['devoluttion'],
      newConsignment: json['new_consignment'],
      qtyConsigned: json['qty_consigned'],
    );
  }
}