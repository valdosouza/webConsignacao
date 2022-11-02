import 'package:appweb/app/core/domain/entity/entity_entity.dart';

class EntityModel extends EntityEntity {
  EntityModel({
    int? id,
    String? nameCompany,
    String? nickTrade,
    int? tbLineBuinessId,
    String? aniversary,
    String? note,
  }) : super(
          id: id ?? 0,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBuinessId: tbLineBuinessId ?? 0,
          aniversary: aniversary ?? "",
          note: note ?? "",
        );

  factory EntityModel.fromJson(Map<String, dynamic> json) {
    return EntityModel(
      id: json['id'] as int? ?? 0,
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      tbLineBuinessId: json['tb_line_buiness_id'] as int? ?? 0,
      aniversary: json['aniversary'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }
}
