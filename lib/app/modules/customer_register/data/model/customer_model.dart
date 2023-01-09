import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({
    int? id,
    int? tbInstitutionId,
    int? tbSalesmanId,
    int? tbCarrierId,
    int? tbSalesRouteId,
    String? nameSalesRoute,
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
          tbSalesRouteId: tbSalesRouteId ?? 0,
          salesRouteName: nameSalesRoute ?? "",
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
      tbSalesRouteId: json['tb_sales_route_id'] as int? ?? 0,
      nameSalesRoute: json['sales_route_name'] as String? ?? "",
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
      consumer: "N",
      multiplier: 0,
      active: "S",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_salesman_id'] = tbSalesmanId;
    data['salesman_name'] = salesmanName;
    data['tb_carrier_id'] = tbCarrierId;
    data['tb_sales_route_id'] = tbSalesRouteId;
    data['sales_route_name'] = salesRouteName;
    data['credit_status'] = creditStatus;
    data['credit_value'] = 0;
    data['wallet'] = wallet;
    data['consumer'] = consumer;
    data['multiplier'] = 0;
    data['active'] = active;
    return data;
  }
}
