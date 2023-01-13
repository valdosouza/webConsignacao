import 'package:appweb/app/modules/Core/domain/entity/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  ProductListModel({
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

  factory ProductListModel.fromJson(Map<String?, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      active: json['active'] as String? ?? "",
    );
  }
}
