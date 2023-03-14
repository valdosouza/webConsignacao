import 'package:appweb/app/modules/Core/domain/entity/collaborator_list_entity.dart';

class CollaboratorListModel extends CollaboratorListEntity {
  CollaboratorListModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    String? docKind,
    String? docNumber,
    int? tbLineBusinessId,
    String? nameLineBusiness,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          docKind: docKind ?? "",
          docNumber: docNumber ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          nameLineBusiness: nameLineBusiness ?? "",
        );

  factory CollaboratorListModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorListModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      docKind: json['doc_kind'] as String? ?? "",
      docNumber: json['doc_number'] as String? ?? "",
      tbLineBusinessId: json['tb_linebusiness_id'] as int? ?? 0,
      nameLineBusiness: json['name_linebusiness'] as String? ?? "",
    );
  }
}
