class OrderConsignmentCheckpointEntity {
  OrderConsignmentCheckpointEntity({
    OrderConsignmentCheckpointOrderEntity? order,
    List<OrderConsignmentCheckpointItemsEntity>? items,
    List<OrderConsignmentCheckpointPaymentEntity>? payments,
  });
}

class OrderConsignmentCheckpointOrderEntity {
  OrderConsignmentCheckpointOrderEntity({
    int? id,
    int? tbInstitutionId,
    int? tbCustomerId,
    String? nameCustomer,
    String? dtRecord,
    double? totalValue,
    double? changeValue,
    double? previousDebiBalance,
    double? currentDebitBalance,
  });
}

class OrderConsignmentCheckpointItemsEntity {
  OrderConsignmentCheckpointItemsEntity({
    int? tbProductId,
    String? nameProduct,
    double? bonus,
    double? qtyConsigned,
    double? leftover,
    double? qtySold,
    double? unitValue,
    double? subtotal,
  });
}

class OrderConsignmentCheckpointPaymentEntity {
  OrderConsignmentCheckpointPaymentEntity({
    int? tbPaymentTypeId,
    String? namePaymentType,
    double? value,
  });
}
