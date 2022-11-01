import 'package:appweb/app/modules/customer_register/domain/entity/customer_salesman_entity.dart';

class CustomerSalesmanModel extends CustomerSalesmanEntity {
  CustomerSalesmanModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    int? tbLineBusinessId,
    String? descLineBusiness,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          descLineBusiness: descLineBusiness ?? "",
        );

  factory CustomerSalesmanModel.fromJson(Map<String, dynamic> json) {
    return CustomerSalesmanModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      tbLineBusinessId: json['tb_linebusiness_id'] as int? ?? 0,
      descLineBusiness: json['desc_linebusiness'] as String? ?? "",
    );
  }
}
