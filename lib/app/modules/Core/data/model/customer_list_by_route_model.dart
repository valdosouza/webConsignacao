import 'package:appweb/app/modules/Core/domain/entity/customer_list_by_route_entity.dart';

class CustomerListByRouteModel extends CustomerListByRouteEntity {
  CustomerListByRouteModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    String? docKind,
    String? docNumber,
    int? tbSalesRouteIid,
    String? nameSalesRoute,
    int? sequence,
    String? turnBack,
    String? street,
    String? nmbr,
    String? complement,
    super.expanded,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          docKind: docKind ?? "",
          docNumber: docNumber ?? "",
          tbSalesRouteIid: tbSalesRouteIid ?? 0,
          nameSalesRoute: nameSalesRoute ?? "",
          sequence: sequence ?? 0,
          turnBack: turnBack ?? "N",
          street: street ?? "",
          nmbr: nmbr ?? "",
          complement: complement ?? "",
        );

  factory CustomerListByRouteModel.fromJson(Map<String, dynamic> json) {
    return CustomerListByRouteModel(
      id: json['tb_customer_id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      docKind: json['doc_kind'] as String? ?? "",
      docNumber: json['doc_number'] as String? ?? "",
      tbSalesRouteIid: json['tb_sales_route_id'] as int? ?? 0,
      nameSalesRoute: json['name_sales_route'] as String? ?? "",
      sequence: json['sequence'] as int? ?? 0,
      turnBack: json['turn_back'] as String? ?? "N",
      street: json['street'] as String? ?? "",
      nmbr: json['nmbr'] as String? ?? "",
      complement: json['complement'] as String? ?? "",
      expanded: false,
    );
  }
}
