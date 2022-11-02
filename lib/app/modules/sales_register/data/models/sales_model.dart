import 'package:appweb/app/modules/sales_register/domain/entity/sale_entity.dart';

class SalesModel extends SalesEntity {
  const SalesModel({
    required super.id,
    required super.institution,
    required super.description,
    required super.active,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution": institution,
        "description": description,
        "active": active,
      };

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      id: json["id"],
      institution: json["institution"],
      description: json["description"],
      active: json["active"],
    );
  }
}