import 'package:appweb/app/modules/line_business_register/domain/entity/line_business_entity.dart';

// ignore: must_be_immutable
class LineBusinessModel extends LinebusinessEntity {
  LineBusinessModel({
    required int id,
    required int institution,
    required String description,
    required String active,
  }) : super(
            id: id,
            institution: institution,
            description: description,
            active: active);

  factory LineBusinessModel.fromJson(Map<String, dynamic> json) {
    return LineBusinessModel(
      id: int.parse(json['id'].toString()),
      institution: int.parse(json['tb_institution_id'].toString()),
      description: json['description'] as String,
      active: json['active'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['tb_institution_id'] = institution.toString();
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
