import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    int? id,
    int? tbInstitutionId,
    int? tbSalesmanId,
    int? tbCarrierId,
    String? creditStatus,
    String? creditValue,
    String? wallet,
    String? consumer,
    String? multiplier,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbSalesmanId: tbSalesmanId ?? 0,
          tbCarrierId: tbCarrierId ?? 0,
          creditStatus: creditStatus ?? "",
          creditValue: creditValue ?? "",
          wallet: wallet ?? "",
          consumer: consumer ?? "",
          multiplier: multiplier ?? "",
          active: active ?? "",
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbSalesmanId: json['tb_salesman_id'] as int? ?? 0,
      tbCarrierId: json['tb_carrier_id'] as int? ?? 0,
      creditStatus: json['credit_status'] as String? ?? "",
      creditValue: json['credit_value'] is String
          ? json['credit_value']
          : int.parse(json['credit_value']),
      wallet: json['wallet'] as String? ?? "",
      consumer: json['consumer'] as String? ?? "",
      multiplier: json['multiplier'] is String
          ? json['multiplier']
          : int.parse(json['multiplier']),
      active: json['active'] as String? ?? "",
    );
  }
}
