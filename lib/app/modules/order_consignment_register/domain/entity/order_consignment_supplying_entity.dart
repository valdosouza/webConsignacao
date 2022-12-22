class OrderConsignmentSupplyingEntity {
  OrderConsignmentSupplyingEntity({
    OrderConsignmentSupplyingOrderEntity? order,
    List<OrderConsignmentSupplyingItemsEntity>? items,
  });
}

class OrderConsignmentSupplyingOrderEntity {
  OrderConsignmentSupplyingOrderEntity({
    int? id,
    int? tbInstitutionId,
    int? tbCustomerId,
    String? nameCustomer,
    double? currentDebitBalance,
  });
}

class OrderConsignmentSupplyingItemsEntity {
  OrderConsignmentSupplyingItemsEntity({
    int? tbProductId,
    String? nameProduct,
    double? bonus,
    double? leftover,
    double? devolution,
    double? newConsignment,
    double? qtyConsigned,
    double? unitValue,
  });
}
