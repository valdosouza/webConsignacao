import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/company_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/entity_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/person_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/phone.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';

// ignore: must_be_immutable
class  CollaboratorModel extends CollaboratorEntity{
  CollaboratorModel(
 {  int? id,
    int? institution,
    String? name,
    String? dtAdmission,
    String? dtResignation,
    String? active,
    EntityModel? entity,
    CompanyModel? company,
    PersonModel? person,
    AddressModel? address,
    PhoneModel? phone,}
  ) : super (
    id: id ?? 0,
    name: name,
    institution: institution ?? 1,
    dtAdmission: dtAdmission,
    dtResignation: dtResignation,
    active: active,
    entity: entity ?? EntityModel(),
    company: company ?? CompanyModel(),
    person: person ?? PersonModel(),
    address: address ?? AddressModel(),
    phone: phone ?? PhoneModel()
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'institution': institution,
      'dtAdmission': dtAdmission,
      'name': name,
      'dtResignation': dtResignation,
      'active': active,
      'entity': entity?.toMap(),
      'company': company?.toMap(),
      'person': person?.toMap(),
      'address': address?.toMap(),
      'phone': phone?.toMap(),
    };
  }

  factory CollaboratorModel.fromMap(Map<String, dynamic> map) {
    return CollaboratorModel(
      id: map['id'] != null ? map['id'] as int : 0,
      institution: map['institution'] != null ? map['institution'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      dtAdmission: map['dtAdmission'] != null ? map['dtAdmission'] as String : null,
      dtResignation: map['dtResignation'] != null ? map['dtResignation'] as String : null,
      active: map['active'] != null ? map['active'] as String : null,
      entity: map['entity'] != null ? EntityModel.fromMap(map['entity'] as Map<String,dynamic>) : null,
      company: map['company'] != null ? CompanyModel.fromMap(map['company'] as Map<String,dynamic>) : null,
      person: map['person'] != null ? PersonModel.fromMap(map['person'] as Map<String,dynamic>) : null,
      address: map['address'] != null ? AddressModel.fromMap(map['address'] as Map<String,dynamic>) : null,
      phone: map['phone'] != null ? PhoneModel.fromMap(map['phone'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollaboratorModel.fromJson(String source) => CollaboratorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static CollaboratorModel fromEntity(CollaboratorEntity entity) {
    return CollaboratorModel(
      id: entity.id,
      institution: entity.institution,
      name: entity.name,
      dtAdmission: entity.dtAdmission,
      dtResignation: entity.dtResignation,
      active: entity.active,
      entity: entity.entity,
      company: entity.company,
      person: entity.person,
      address: entity.address,
      phone: entity.phone
    );
  }
}