import 'package:appweb/app/modules/product_register/domain/entity/product_register_entity.dart';

class ProductRegisterModel extends ProductRegisterEntity {
  ProductRegisterModel({
    int? id,
    int? tbInstitutionId,
    String? description,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          description: description ?? "",
          active: active ?? "",
        );

  factory ProductRegisterModel.fromJson(Map<String?, dynamic> json) {
    return ProductRegisterModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      active: json['active'] as String? ?? "",
    );
  }

  factory ProductRegisterModel.empty() {
    return ProductRegisterModel(
      id: 0,
      tbInstitutionId: 0,
      description: "",
      active: "S",
    );
  }
}
