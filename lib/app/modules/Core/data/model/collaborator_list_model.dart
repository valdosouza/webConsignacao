import 'package:appweb/app/modules/Core/domain/entity/collaborator_list_entity.dart';

class CollaboratorListModel extends CollaboratorListEntity {
  CollaboratorListModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    String? docType,
    String? documento,
    int? tbLineBusinessId,
    String? descLineBusiness,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          docType: docType ?? "",
          documento: documento ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          descLineBusiness: descLineBusiness ?? "",
        );

  factory CollaboratorListModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorListModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      docType: json['docType'] as String? ?? "",
      documento: json['documento'] as String? ?? "",
      tbLineBusinessId: json['tb_linebusiness_id'] as int? ?? 0,
      descLineBusiness: json['desc_linebusiness'] as String? ?? "",
    );
  }
}
