import 'package:appweb/app/modules/institution_register/domain/entity/state_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StateModel extends StateEntity {
  StateModel({
    int? id,
    int? tbCountryId,
    String? abbreviation,
    String? name,
  }) : super(
          id: id ?? 0,
          tbCountryId: tbCountryId ?? 0,
          abbreviation: abbreviation ?? "",
          name: name ?? "",
        );

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      tbCountryId: json['tb_country_id'],
      name: json['name'],
      abbreviation: json['abbreviation'],
    );
  }
}
