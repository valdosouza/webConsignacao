import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    int? id,
    int? tbInstitutionId,
    int? tbSalesmanId,
    int? tbCarrierId,
    String? salesmanName,
    String? creditStatus,
    double? creditValue,
    String? wallet,
    String? consumer,
    double? multiplier,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbSalesmanId: tbSalesmanId ?? 0,
          tbCarrierId: tbCarrierId ?? 0,
          salesmanName: salesmanName ?? "",
          creditStatus: creditStatus ?? "",
          creditValue: creditValue ?? 0,
          wallet: wallet ?? "",
          consumer: consumer ?? "",
          multiplier: multiplier ?? 0,
          active: active ?? "",
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      tbSalesmanId: json['tb_salesman_id'] is String
          ? int.parse(json['tb_salesman_id'])
          : json['tb_salesman_id'],
      tbCarrierId: json['tb_carrier_id'] as int? ?? 0,
      salesmanName: json['salesman_name'] as String? ?? "",
      creditStatus: json['credit_status'] as String? ?? "",
      creditValue: json['credit_value'] is String
          ? double.parse(json['credit_value'])
          : json['multiplier'],
      wallet: json['wallet'] as String? ?? "",
      consumer: json['consumer'] as String? ?? "",
      multiplier: json['multiplier'] is String
          ? double.parse(json['multiplier'])
          : json['multiplier'],
      active: json['active'] as String? ?? "S",
    );
  }
  factory CustomerModel.empty() {
    return CustomerModel(
      id: 0,
      tbInstitutionId: 1,
      tbSalesmanId: 1,
      tbCarrierId: 1,
      creditStatus: "",
      creditValue: 0,
      wallet: "",
      consumer: "",
      multiplier: 0,
      active: "N",
    );
  }
}
