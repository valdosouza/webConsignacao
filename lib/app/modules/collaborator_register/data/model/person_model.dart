import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/person_entity.dart';

// ignore: must_be_immutable
class PersonModel extends PersonEntity {
  PersonModel(
      {int? id,
      String? cpf,
      String? rg,
      String? rgDtEmission,
      String? rgOrganIssuer,
      int? rgStateIssuer,
      String? birthday,
      int? tbProfessionId})
      : super(
            id: id ?? 0,
            cpf: cpf ?? "",
            rg: rg ?? "",
            rgDtEmission: rgDtEmission ?? "",
            rgOrganIssuer: rgOrganIssuer ?? "",
            rgStateIssuer: rgStateIssuer ?? 0,
            birthday: birthday ?? "",
            tbProfessionId: tbProfessionId ?? 0);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> person = <String, dynamic>{};

      person['id'] = id;
      person['cpf'] = cpf;
      person['rg'] = rg;
      person['rg_dt_emission'] = rgDtEmission;
      person['rg_organ_issuer'] = rgOrganIssuer;
      person['rg_state_issuer'] = rgStateIssuer;
      person['birthday'] = birthday;
      person['tb_profession_id'] = tbProfessionId;
    
    return person;
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
        id: map['id'] != null ? map['id'] as int : 0,
        cpf: map['cpf'] != null ? map['cpf'] as String : "",
        rg: map['rg'] != null ? map['rg'] as String : "",
        rgDtEmission: map['rg_dt_emission'] != null
            ? map['rg_dt_emission'] as String
            : "",
        rgOrganIssuer: map['rg_organ_issuer'] != null
            ? map['rg_organ_issuer'] as String
            : "",
        rgStateIssuer:
            map['rg_state_issuer'] != null ? map['rg_state_issuer'] as int : 0,
        birthday: map['birthday'] != null ? map['birthday'] as String : "",
        tbProfessionId: map['tb_profession_id'] != null
            ? map['tb_profession_id'] as int
            : 0);
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
