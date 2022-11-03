// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/data/model/company_model.dart';
import 'package:appweb/app/core/data/model/entity_model.dart';
import 'package:appweb/app/core/data/model/person_model.dart';
import 'package:appweb/app/core/data/model/phone_model.dart';
import 'package:equatable/equatable.dart';

import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';

// ignore: must_be_immutable
class CollaboratorEntity extends Equatable {
  int id;
  int? institution;
  String? dtAdmission;
  String? dtResignation;
  String? active;
  String? salary;
  String? pis;
  String? fathersName;
  String? mothersName;
  String? voteNumber;
  String? voteZone;
  String? voteSection;
  String? militaryCertificate;
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
    this.salary,
    this.pis,
    this.fathersName,
    this.mothersName,
    this.voteNumber,
    this.voteZone,
    this.voteSection,
    this.militaryCertificate,
    this.entity,
    this.company,
    this.person,
    this.address,
    this.phone,
  });

  @override
  List<Object?> get props => [id];
}
