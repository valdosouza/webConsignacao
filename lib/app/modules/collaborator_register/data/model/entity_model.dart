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
      'nameCompany': nameCompany,
      'nickTrade': nickTrade,
      'tbLineBussinessId': tbLineBussinessId,
      'nameLineBussiness': nameLineBussiness,
      'aniversary': aniversary,
      'note': note,
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      nameCompany: map['nameCompany'] as String,
      nickTrade: map['nickTrade'] as String,
      tbLineBussinessId: map['tbLineBussinessId'] as int,
      nameLineBussiness: map['nameLineBussiness'] as String,
      aniversary: map['aniversary'] as String,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) =>
      EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
