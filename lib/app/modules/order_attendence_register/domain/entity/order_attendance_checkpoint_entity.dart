class OrderAttendanceCheckpointEntity {
  OrderAttendanceCheckpointEntity({
    OrderAttendanceCheckpointOrderEntity? order,
    List<OrderAttendanceCheckpointItemsEntity>? items,
    List<OrderAttendanceCheckpointPaymentEntity>? payments,
  });
}

class OrderAttendanceCheckpointOrderEntity {
  OrderAttendanceCheckpointOrderEntity({
    int? id,
    int? tbInstitutionId,
    int? tbCustomerId,
    String? nameCustomer,
    double? totalValue,
    double? changeValue,
    double? debitBalance,
  });
}

class OrderAttendanceCheckpointItemsEntity {
  OrderAttendanceCheckpointItemsEntity({
    int? tbProductId,
    int? bonus,
    int? qtyConsigned,
    int? leftover,
    int? qtySold,
    double? unitValue,
  });
}

class OrderAttendanceCheckpointPaymentEntity {
  OrderAttendanceCheckpointPaymentEntity({
    int? tbPaymentTypeId,
    String? namePaymentType,
    double? value,
  });
}
