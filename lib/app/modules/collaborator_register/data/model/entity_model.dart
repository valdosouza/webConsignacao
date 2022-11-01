import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/entity_entity.dart';

class EntityModel extends EntityEntity {
  EntityModel(
      {String? nameCompany,
      String? nickTrade,
      int? tbLineBussinessId,
      String? nameLineBussiness,
      String? aniversary,
      String? note})
      : super(
            nameCompany: nameCompany ?? "",
            nickTrade: nickTrade ?? "",
            tbLineBussinessId: tbLineBussinessId ?? 0,
            nameLineBussiness: nameLineBussiness ?? "",
            aniversary: aniversary ?? "",
            note: note ?? "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name_company': nameCompany,
      'nick_trade': nickTrade,
      'tb_line_buiness_id': tbLineBussinessId,
      'nameLineBussiness': nameLineBussiness,
      'aniversary': aniversary,
      'note': note,
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      nameCompany: map['name_company'] != null ? map['name_company'] as String : "",
      nickTrade: map['nick_trade'] != null ? map['nick_trade'] as String : "",
      tbLineBussinessId: map['tb_line_buiness_id'] != null ? map['tb_line_buiness_id'] as int : 0,
      nameLineBussiness: map['name_line_business'] != null ?  map['name_line_business'] as String: "",
      aniversary: map['aniversary'] != null ? map['aniversary'] as String : "",
      note: map['note'] != null ? map['note'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) =>
      EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
