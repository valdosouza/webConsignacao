import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/company_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/entity_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/person_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/phone.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';

// ignore: must_be_immutable
class CollaboratorModel extends CollaboratorEntity {
  CollaboratorModel({
    int? id,
    int? institution,
    String? dtAdmission,
    String? dtResignation,
    String? active,
    String? salary,
    String? pis,
    String? fathersName,
    String? mothersName,
    String? voteNumber,
    String? voteZone,
    String? voteSection,
    String? militaryCertificate,
    EntityModel? entity,
    CompanyModel? company,
    PersonModel? person,
    AddressModel? address,
    PhoneModel? phone,
  }) : super(
            id: id ?? 0,
            institution: institution ?? 1,
            dtAdmission: dtAdmission ?? "",
            dtResignation: dtResignation ?? "",
            active: active ?? "S",
            salary: salary ?? "0.00",
            pis: pis ?? "",
            fathersName: fathersName ?? "",
            mothersName: mothersName ?? "",
            voteNumber: voteNumber ?? "",
            voteZone: voteZone ?? "",
            voteSection: voteSection ?? "",
            militaryCertificate: militaryCertificate ?? "",
            entity: entity ?? EntityModel(),
            company: company ?? CompanyModel(),
            person: person ?? PersonModel(),
            address: address ?? AddressModel(),
            phone: phone ?? PhoneModel());

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    
      map['collaborator'] =  _collaborator();
      map['entity'] =  entity?.toMap();
      map['person'] =  person?.toMap();
      map['address'] =  address?.toMap();
      map['phone'] =  phone?.toMap();
    return map;
  }
  Map<String, dynamic> _collaborator() {
    Map<String, dynamic> collaborator = <String, dynamic>{};
          
      collaborator['id'] = id;
      collaborator['tb_institution_id'] = institution ?? 1;
      collaborator['dt_admission'] = dtAdmission ?? "";
      collaborator['dt_resignation'] = dtResignation ?? "";
      collaborator['active'] = "S";
      collaborator['salary'] = "0.00";
      collaborator["pis"] = pis ?? "";
      collaborator['fahters_name'] = fathersName ?? "";
      collaborator['mothers_name'] = mothersName ?? "";
      collaborator['vote_number'] = voteNumber ?? "";
      collaborator['vote_zone'] = voteZone ?? "";
      collaborator['vote_section'] = voteSection ?? "";
      collaborator['military_certificate'] = militaryCertificate ?? "";
    return collaborator;
  }



  factory CollaboratorModel.fromMap(map) {
    return CollaboratorModel(
      id: map['collaborator']['id'] as int,
      institution:
          map['collaborator']['tb_institution_id'] != null ? map['collaborator']['tb_institution_id'] as int : null,
      dtAdmission:
          map['collaborator']['dt_admission'] != null ? map['collaborator']['dt_admission'] as String : null,
      dtResignation:
          map['collaborator']['dt_resignation'] != null ? map['collaborator']['dt_resignation'] as String : null,
      active: map['collaborator']['active'] != null ? map['collaborator']['active'] as String : null,
      salary: map['collaborator']['salary'] != null ? map['collaborator']['salary'] as String : null,
      pis: map['collaborator']['pis'] != null ? map['collaborator']['pis'] as String : null,
      fathersName:
          map['collaborator']['fahters_name'] != null ? map['collaborator']['fahters_name'] as String : null,
      mothersName:
          map['collaborator']['mothers_name'] != null ? map['collaborator']['mothers_name'] as String : null,
      voteNumber:
          map['collaborator']['vote_number'] != null ? map['collaborator']['vote_number'] as String : null,
      voteZone: map['collaborator']['vote_zone'] != null ? map['collaborator']['vote_zone'] as String : null,
      voteSection:
          map['collaborator']['vote_section'] != null ? map['collaborator']['vote_section'] as String : null,
      militaryCertificate: map['collaborator']['military_certificate'] != null
          ? map['collaborator']['military_certificate'] as String
          : null,
      entity: map['entity'] != null
          ? EntityModel.fromMap(map['entity'] as Map<String, dynamic>)
          : null,
      company: map['company'] != null
          ? CompanyModel.fromMap(map['company'] as Map<String, dynamic>)
          : null,
      person: map['person'] != null
          ? PersonModel.fromMap(map['person'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null
          ? PhoneModel.fromMap(map['phone'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CollaboratorModel.fromEntity(CollaboratorEntity model) {
    return CollaboratorModel(
      id: model.id,
      institution: model.institution,
      dtAdmission: model.dtAdmission,
      dtResignation: model.dtResignation,
      active: model.active,
      salary: model.salary,
      pis: model.pis,
      fathersName: model.fathersName,
      mothersName: model.mothersName,
      voteNumber: model.voteNumber,
      voteZone: model.voteZone,
      voteSection: model.voteSection,
      militaryCertificate: model.militaryCertificate,
      entity: model.entity,
      company: model.company,
      person: model.person,
      address: model.address,
      phone: model.phone,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollaboratorModel.fromAPI(json) {
    return CollaboratorModel(
        id: json['id'],
        entity: EntityModel(
            nameCompany: json['name_company'],
            nickTrade: json['nick_trade'],
            tbLineBussinessId: json['tb_linebusiness_id'],
            nameLineBussiness: json["desc_linebusiness"]));
  }
}
