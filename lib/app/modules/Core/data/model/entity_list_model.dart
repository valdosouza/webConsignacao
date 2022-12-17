import 'package:appweb/app/modules/Core/domain/entity/entity_list_entity.dart';

class EntityListModel extends EntityListEntity {
  EntityListModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    int? tbLineBusinessId,
    String? nameLinebusiness,
    String? aniversary,
    String? note,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBusinessId: tbLineBusinessId ?? 0,
          nameLinebusiness: nameLinebusiness ?? "",
          aniversary: aniversary ?? "",
          note: note ?? "",
        );

  factory EntityListModel.fromJson(Map<String, dynamic> json) {
    return EntityListModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      tbLineBusinessId: json['tb_line_buiness_id'] as int? ?? 0,
      nameLinebusiness: json['name_linebusiness'] as String? ?? "",
      aniversary: json['aniversary'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }
  factory EntityListModel.empty() {
    return EntityListModel(
      id: 0,
      nameCompany: "",
      nickTrade: "",
      tbLineBusinessId: 1,
      nameLinebusiness: '',
      aniversary: "",
      note: "",
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_company'] = nameCompany;
    data['nick_trade'] = nickTrade;
    data['tb_linebusiness_id'] = tbLineBusinessId;
    data['name_linebusiness'] = nameLinebusiness;
    data['aniversary'] = aniversary;
    data['note'] = note;
    return data;
  }
}
