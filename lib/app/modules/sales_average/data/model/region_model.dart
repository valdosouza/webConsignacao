import 'package:appweb/app/modules/sales_average/domain/entity/region_entity.dart';

class RegionModel extends RegionEntity {
  RegionModel({
    required super.id,
    required super.name,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
