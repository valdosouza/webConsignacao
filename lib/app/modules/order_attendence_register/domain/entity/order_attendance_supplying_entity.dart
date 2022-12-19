class OrderAttendanceSupplyingEntity{
  OrderAttendanceSupplyingEntity({
    OrderAttendanceSupplyingOrderEntity? order,
    List<OrderAttendanceSupplyingItemsEntity>? items,
  });
}

class OrderAttendanceSupplyingOrderEntity{

  OrderAttendanceSupplyingOrderEntity({
    int? id,
    int? tbInstitutionId,
    int? tbCustomerId,
    String? nameCustomer,
  });

}

class OrderAttendanceSupplyingItemsEntity{

  OrderAttendanceSupplyingItemsEntity({
    int? tbProductId,
    int? nameProduct,
    int? bonus,
    int? leftover,
    int? devolution,
    int? newConsignment,
    int? qtyConsigned,
  });

}