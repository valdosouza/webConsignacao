import 'package:appweb/app/modules/sales_route_register/domain/entity/sale_entity.dart';

// ignore: must_be_immutable
class SalesModel extends SalesEntity {
  SalesModel(
    super.id,
    super.institution,
    super.description,
    super.active,
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution": institution,
        "description": description,
        "active": active,
      };

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      json["id"],
      json["institution"],
      json["description"],
      json["active"],
    );
  }
}
