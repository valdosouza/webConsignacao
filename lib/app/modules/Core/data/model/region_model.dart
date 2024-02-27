import 'package:appweb/app/modules/Core/domain/entity/region_register_entity.dart';

class RegionModel extends RegionEntity {
  RegionModel({
    int? id,
    int? tbInstitutionId,
    String? description,
    int? tbSalesmanId,
    String? salesmanName,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          description: description ?? "",
          tbSalesmanId: tbInstitutionId ?? 0,
          salesmanName: salesmanName ?? "",
          active: active ?? "",
        );

  factory RegionModel.fromJson(Map<String?, dynamic> json) {
    return RegionModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      tbSalesmanId: json['tb_salesman_id'] is String
          ? int.parse(json['tb_salesman_id'])
          : json['tb_salesman_id'],
      salesmanName: json['salesman_name'],
      active: json['active'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['tb_salesman_id'] = tbSalesmanId;
    data['active'] = active;
    return data;
  }

  factory RegionModel.empty() {
    return RegionModel(
      id: 0,
      tbInstitutionId: 0,
      description: "",
      tbSalesmanId: 0,
      salesmanName: "",
      active: "S",
    );
  }
}
