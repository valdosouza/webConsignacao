import 'package:appweb/app/modules/Core/domain/entity/person_entity.dart';

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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cpf'] = cpf.replaceAll(".", "").replaceAll("-", "");
    data['rg'] = rg;
    data['rg_dt_emission'] = rgDtEmission;
    data['rg_organ_issuer'] = rgOrganIssuer;
    data['rg_state_issuer'] = 0;
    data['birthday'] = birthday;
    data['tb_profession_id'] = 0;
    return data;
  }

  factory PersonModel.empty() {
    return PersonModel(
      id: 0,
      birthday: "",
      cpf: "",
      rg: "",
      rgDtEmission: "",
      rgOrganIssuer: "",
      rgStateIssuer: 0,
      tbProfessionId: 0,
    );
  }
}
