class OrderConsignmentSupplyingEntity {
  OrderConsignmentSupplyingEntity({
    OrderConsignmentSupplyingOrderEntity? order,
    List<OrderConsignmentSupplyingCardEntity>? items,
  });
}

class OrderConsignmentSupplyingOrderEntity {
  OrderConsignmentSupplyingOrderEntity({
    int? id,
    int? tbInstitutionId,
    int? tbCustomerId,
    String? nameCustomer,
    int? tbSalesmanId,
    String? nameSalesman,
    String? dtRecord,
    double? currentDebitBalance,
    String? note,
  });
}

class OrderConsignmentSupplyingCardEntity {
  OrderConsignmentSupplyingCardEntity({
    int? tbProductId,
    String? nameProduct,
    double? bonus,
    double? leftover,
    double? devolution,
    double? newConsignment,
    double? qttyConsigned,
    double? unitValue,
  });
}
