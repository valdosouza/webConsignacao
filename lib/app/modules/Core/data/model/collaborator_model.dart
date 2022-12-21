import 'package:appweb/app/modules/Core/domain/entity/collaborator_list_entity.dart';

class CollaboratorModel extends CollaboratorEntity {
  CollaboratorModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    String? docKind,
    String? docNumber,
    int? tbLineBusinessId,
    String? descLineBusiness,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          docKind: docKind ?? "",
          docNumber: docNumber ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          descLineBusiness: descLineBusiness ?? "",
        );

  factory CollaboratorModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      docKind: json['doc_kind'] as String? ?? "",
      docNumber: json['doc_number'] as String? ?? "",
      tbLineBusinessId: json['tb_linebusiness_id'] as int? ?? 0,
      descLineBusiness: json['desc_linebusiness'] as String? ?? "",
    );
  }
}
