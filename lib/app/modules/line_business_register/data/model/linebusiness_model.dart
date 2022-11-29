import 'package:appweb/app/modules/line_business_register/domain/entity/linebusiness_entity.dart';

class LinebusinessModel extends LinebusinessEntity {
  LinebusinessModel({
    required int id,
    required int tbInstitutionId,
    required String description,
    required String active,
  }) : super(
            id: id,
            tbInstitutionId: tbInstitutionId,
            description: description,
            active: active);

  factory LinebusinessModel.fromJson(Map<String, dynamic> json) {
    return LinebusinessModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String,
      active: json['active'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
