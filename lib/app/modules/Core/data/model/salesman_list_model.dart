import 'package:appweb/app/modules/Core/domain/entity/salesman_list_entity.dart';

class SalesmanListModel extends SalesmanListEntity {
  SalesmanListModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    int? tbLineBusinessId,
    String? nameLineBusiness,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          nameLineBusiness: nameLineBusiness ?? "",
        );

  factory SalesmanListModel.fromJson(Map<String, dynamic> json) {
    return SalesmanListModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      tbLineBusinessId: json['tb_linebusiness_id'] as int? ?? 0,
      nameLineBusiness: json['desc_linebusiness'] as String? ?? "",
    );
  }
}
