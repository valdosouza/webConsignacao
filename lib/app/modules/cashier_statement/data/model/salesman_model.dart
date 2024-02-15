import 'package:appweb/app/modules/cashier_statement/domain/entity/salesman_entity.dart';

class SalesmanModel extends SalesmanEntity {
  SalesmanModel({
    int? id,
    int? tbInstitutionId,
    String? nameCompany,
    String? nickTrade,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
        );

  factory SalesmanModel.fromJson(Map<String, dynamic> json) {
    return SalesmanModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      nameCompany: json['name_company'],
      nickTrade: json['nick_trade'],
    );
  }

  factory SalesmanModel.empty() {
    return SalesmanModel();
  }
}
