import 'package:appweb/app/modules/line_business_register/domain/entities/line_business.dart';

class LineBusinessModel extends LineBusinessEntity {
  LineBusinessModel(
      {required super.id,
      required super.idInstitution,
      required super.description,
      required super.active});

        factory LineBusinessModel.fromJson(Map<String, dynamic> json) {
    return LineBusinessModel(
        id: json['id'],
        idInstitution: json['tb_institution_id'],
        description: json['description'].toString(),
        active: json['active'].toString() == 'S' ? true : false);
  }

  toMap() {
    return {
      'id': id.toString(),
      'tb_institution_id': idInstitution.toString(),
      'description': description,
      'active': active ? 'S' : 'N'
    };
  }

  copyWith(
      {int? id, int? idInstitution, String? description, bool? active}) {
    return LineBusinessModel(
        id: id ?? this.id,
        idInstitution: idInstitution ?? this.idInstitution,
        description: description ?? this.description,
        active: active ?? this.active);
  }
}
