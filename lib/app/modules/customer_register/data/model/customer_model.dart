import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    int? tbSalesmanId,
    int? tbCarrierId,
    String? creditStatus,
    double? creditValue,
    String? wallet,
    String? consumer,
    double? multiplier,
    String? active,
  }) : super(
          tbSalesmanId: tbSalesmanId = 0,
          tbCarrierId: tbCarrierId = 0,
          creditStatus: creditStatus = "",
          creditValue: creditValue = 0.0,
          wallet: wallet = "",
          consumer: consumer = "",
          multiplier: multiplier = 0.0,
          active: active ?? "",
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      tbSalesmanId: json['tb_salesman_id'] as int? ?? 0,
      tbCarrierId: json['tb_carrier_id'] as int? ?? 0,
      creditStatus: json['credit_status'] as String? ?? "",
      creditValue: json['credit_value'] as double? ?? 0.0,
      wallet: json['wallet'] as String? ?? "",
      consumer: json['consumer'] as String? ?? "",
      multiplier: json['multiplier'] as double? ?? 0.0,
      active: json['active'] as String? ?? "",
    );
  }
}
