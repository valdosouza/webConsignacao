import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/person_entity.dart';

// ignore: must_be_immutable
class PersonModel extends PersonEntity {
  PersonModel(
      {String? cpf,
      String? rg,
      String? rgDtEmission,
      String? rgOrganIssuer,
      String? rgStateIssuer,
      String? birthday,
      int? tbProfessionId})
      : super(
            cpf: cpf ?? "",
            rg: rg ?? "",
            rgDtEmission: rgDtEmission ?? "",
            rgOrganIssuer: rgOrganIssuer ?? "",
            rgStateIssuer: rgStateIssuer ?? "",
            birthday: birthday ?? "",
            tbProfessionId: tbProfessionId ?? 0);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cpf': cpf,
      'rg': rg,
      'rgDtEmission': rgDtEmission,
      'rgOrganIssuer': rgOrganIssuer,
      'rgStateIssuer': rgStateIssuer,
      'birthday': birthday,
      'tbProfessionId': tbProfessionId,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      cpf: map['cpf'] as String,
      rg: map['rg'] as String,
      rgDtEmission: map['rgDtEmission'] as String,
      rgOrganIssuer: map['rgOrganIssuer'] as String,
      rgStateIssuer: map['rgStateIssuer'] as String,
      birthday: map['birthday'] as String,
      tbProfessionId: map['tbProfessionId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
