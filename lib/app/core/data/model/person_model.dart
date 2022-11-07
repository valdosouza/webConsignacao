import 'package:appweb/app/core/domain/entity/person_entity.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    int? id,
    String? cpf,
    String? rg,
    String? rgDtEmission,
    String? rgOrganIssuer,
    int? rgStateIssuer,
    String? birthday,
    int? tbProfessionId,
  }) : super(
            id: id ?? 0,
            cpf: cpf ?? "",
            rg: rg ?? "",
            rgDtEmission: rgDtEmission ?? "",
            rgOrganIssuer: rgOrganIssuer ?? "",
            rgStateIssuer: rgStateIssuer ?? 0,
            birthday: birthday ?? "",
            tbProfessionId: tbProfessionId ?? 0);

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int? ?? 0,
      cpf: json['cpf'] as String? ?? "",
      rg: json['rg'] as String? ?? "",
      rgDtEmission: json['rg_dt_emission'] as String? ?? "",
      rgOrganIssuer: json['rg_organ_issuer'] as String? ?? "",
      rgStateIssuer: json['rg_state_issuer'] as int? ?? 0,
      birthday: json['birthday'] as String? ?? "",
      tbProfessionId: json['tb_profession_id'] as int? ?? 0,
    );
  }
}