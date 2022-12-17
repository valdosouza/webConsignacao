import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/data/model/company_model.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_main_entity.dart';
import 'package:appweb/app/modules/Core/data/model/person_model.dart';
import 'package:appweb/app/modules/Core/data/model/phone_model.dart';

class CollaboratorMainModel extends CollaboratorMainEntity {
  CollaboratorMainModel({
    required CollaboratorModel collaborator,
    required EntityListModel entity,
    CompanyModel? company,
    PersonModel? person,
    required AddressModel address,
    required PhoneModel phone,
  }) : super(
          collaborator: collaborator,
          entity: entity,
          company: company,
          person: person,
          address: address,
          phone: phone,
        );

  factory CollaboratorMainModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorMainModel(
      collaborator: CollaboratorModel.fromJson(json['collaborator']),
      entity: EntityListModel.fromJson(json['entity']),
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
      person:
          json['person'] != null ? PersonModel.fromJson(json['person']) : null,
      address: AddressModel.fromJson(json['address']),
      phone: PhoneModel.fromJson(json['phone']),
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['collaborator'] = collaborator.toJson();
    data['entity'] = entity.toJson();
    data['company'] = company?.toJson();
    data['person'] = person?.toJson();
    data['address'] = address.toJson();
    data['phone'] = phone.toJson();
    return data;
  }

  factory CollaboratorMainModel.empty() {
    return CollaboratorMainModel(
      collaborator: CollaboratorModel.empty(),
      entity: EntityListModel.empty(),
      company: CompanyModel.empty(),
      person: PersonModel.empty(),
      address: AddressModel.empty(),
      phone: PhoneModel.empty(),
    );
  }
}
