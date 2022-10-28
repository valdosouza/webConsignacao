// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/collaborator_register/data/model/person_model.dart';
import 'package:equatable/equatable.dart';

import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/company_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/entity_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/phone.dart';


// ignore: must_be_immutable
class CollaboratorEntity extends Equatable {
  int id;
  int? institution;
  String? dtAdmission;
  String? dtResignation;
  String? active;
  EntityModel? entity;
  CompanyModel? company;
  PersonModel? person;
  AddressModel? address;
  PhoneModel? phone;
  CollaboratorEntity({
    required this.id,
    this.institution,
    this.dtAdmission,
    this.dtResignation,
    this.active,
    this.entity,
    this.company,
    this.person,
    this.address,
    this.phone,
  });

  @override
  List<Object?> get props => [id];
}
