import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/data/model/company_model.dart';
import 'package:appweb/app/modules/Core/data/model/entity_model.dart';
import 'package:appweb/app/modules/Core/data/model/person_model.dart';
import 'package:appweb/app/modules/Core/data/model/phone_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';

class CollaboratorMainEntity {
  CollaboratorModel collaborator;
  EntityModel entity;
  CompanyModel? company;
  PersonModel? person;
  AddressModel address;
  PhoneModel phone;
  CollaboratorMainEntity({
    required this.collaborator,
    required this.entity,
    this.company,
    this.person,
    required this.address,
    required this.phone,
  });
}
