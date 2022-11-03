import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/entity_entity.dart';

class EntityModel extends EntityEntity {
  EntityModel(
      {int? id,
      String? nameCompany,
      String? nickTrade,
      int? tbLineBussinessId,
      String? nameLineBussiness,
      String? aniversary,
      String? note})
      : super(
            id: id ?? 0,
            nameCompany: nameCompany ?? "",
            nickTrade: nickTrade ?? "",
            tbLineBussinessId: tbLineBussinessId ?? 0,
            nameLineBussiness: nameLineBussiness ?? "",
            aniversary: aniversary ?? "",
            note: note ?? "");

  Map<String, dynamic> toMap() {
    Map<String, dynamic> entity = <String, dynamic>{};
    
    entity['id'] = id;
    entity['name_company'] = nameCompany;
    entity['nick_trade'] = nickTrade;
    entity['tb_linebusiness_id'] = tbLineBussinessId;
    entity['aniversary'] = aniversary;
    entity['note'] = note;
    
    return entity;
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      id:
          map['id'] != null ? map['id'] as int : 0,
      nameCompany:
          map['name_company'] != null ? map['name_company'] as String : "",
      nickTrade: map['nick_trade'] != null ? map['nick_trade'] as String : "",
      tbLineBussinessId: map['tb_linebusiness_id'] != null
          ? map['tb_linebusiness_id'] as int
          : 0,
      aniversary: map['aniversary'] != null ? map['aniversary'] as String : "",
      note: map['note'] != null ? map['note'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) =>
      EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
