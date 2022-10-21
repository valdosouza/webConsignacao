import 'package:appweb/app/modules/institution_register/domain/entity/city_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel extends CityEntity {
  CityModel({
    int? id,
    int? tbStateId,
    String? name,
    String? ibge,
  }) : super(
          id: id ?? 0,
          tbStateId: tbStateId ?? 0,
          name: name ?? "",
          ibge: ibge ?? "",
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      tbStateId: json['tb_state_id'],
      name: json['name'],
      ibge: json['ibge'],
    );
  }
}
