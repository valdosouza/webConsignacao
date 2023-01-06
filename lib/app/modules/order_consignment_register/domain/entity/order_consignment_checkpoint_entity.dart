import 'package:appweb/app/modules/Core/domain/entity/order_paid_entity.dart';

class OrderConsignmentCheckpointEntity {
  OrderConsignmentCheckpointEntity({
    OrderConsignmentCheckpointOrderEntity? order,
    List<OrderConsignmentCheckpointCardEntity>? items,
    List<OrderPaidEntity>? payments,
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

class OrderConsignmentCheckpointCardEntity {
  OrderConsignmentCheckpointCardEntity({
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
