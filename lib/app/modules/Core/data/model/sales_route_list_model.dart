import 'package:appweb/app/modules/Core/domain/entity/sales_route_list_entity.dart';

class SalesRouteListModel extends SalesRouteListEntity {
  SalesRouteListModel({
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

  factory SalesRouteListModel.fromJson(Map<String?, dynamic> json) {
    return SalesRouteListModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      active: json['active'] as String? ?? "",
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
