import 'package:appweb/app/modules/sales_route_register/domain/entity/sale_entity.dart';

// ignore: must_be_immutable
class SalesModel extends SalesEntity {
  SalesModel({
    required super.id,
    required super.institution,
    required super.description,
    required super.active,
  });

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "tb_institution_id": institution.toString(),
        "description": description,
        "active": active,
      };

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      id: int.parse(json['id'].toString()),
      institution: int.parse(json['tb_institution_id'].toString()),
      description: json['description'] as String,
      active: json['active'] as String,
    );
  }
}
