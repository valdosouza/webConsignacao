import 'package:appweb/app/core/data/model/company_model.dart';
import 'package:appweb/app/core/data/model/entity_model.dart';
import 'package:appweb/app/core/data/model/person_model.dart';
import 'package:appweb/app/core/data/model/phone_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};

    map['collaborator'] = _collaborator();
    map['entity'] = entity?.toJson();
    map['person'] = person?.toJson();
    map['address'] = address?.toMap();
    map['phone'] = phone?.toJson();
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

  factory CollaboratorModel.fromJson(map) {
    return CollaboratorModel(
      id: map['collaborator']['id'] as int,
      institution: map['collaborator']['tb_institution_id'] != null
          ? map['collaborator']['tb_institution_id'] as int
          : null,
      dtAdmission: map['collaborator']['dt_admission'] != null
          ? map['collaborator']['dt_admission'] as String
          : null,
      dtResignation: map['collaborator']['dt_resignation'] != null
          ? map['collaborator']['dt_resignation'] as String
          : null,
      active: map['collaborator']['active'] != null
          ? map['collaborator']['active'] as String
          : null,
      salary: map['collaborator']['salary'] != null
          ? map['collaborator']['salary'] as String
          : null,
      pis: map['collaborator']['pis'] != null
          ? map['collaborator']['pis'] as String
          : null,
      fathersName: map['collaborator']['fahters_name'] != null
          ? map['collaborator']['fahters_name'] as String
          : null,
      mothersName: map['collaborator']['mothers_name'] != null
          ? map['collaborator']['mothers_name'] as String
          : null,
      voteNumber: map['collaborator']['vote_number'] != null
          ? map['collaborator']['vote_number'] as String
          : null,
      voteZone: map['collaborator']['vote_zone'] != null
          ? map['collaborator']['vote_zone'] as String
          : null,
      voteSection: map['collaborator']['vote_section'] != null
          ? map['collaborator']['vote_section'] as String
          : null,
      militaryCertificate: map['collaborator']['military_certificate'] != null
          ? map['collaborator']['military_certificate'] as String
          : null,
      entity: map['entity'] != null
          ? EntityModel.fromJson(map['entity'] as Map<String, dynamic>)
          : null,
      company: map['company'] != null
          ? CompanyModel.fromJson(map['company'] as Map<String, dynamic>)
          : null,
      person: map['person'] != null
          ? PersonModel.fromJson(map['person'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null
          ? PhoneModel.fromJson(map['phone'] as Map<String, dynamic>)
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

  factory CollaboratorModel.fromAPI(json) {
    return CollaboratorModel(
        id: json['id'],
        entity: EntityModel(
            nameCompany: json['name_company'],
            nickTrade: json['nick_trade'],
            tbLineBusinessId: json['tb_linebusiness_id'],
            nameLineBussiness: json["name_linebusiness"]));
  }
}
