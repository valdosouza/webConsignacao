import 'package:appweb/app/core/domain/entity/address_entity.dart';
import 'package:appweb/app/core/domain/entity/entity_entity.dart';
import 'package:appweb/app/core/domain/entity/company_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';
import 'package:appweb/app/core/domain/entity/person_entity.dart';
import 'package:appweb/app/core/domain/entity/phone_entity.dart';

class CustomerMainEntity {
  CustomerEntity customer;
  EntityEntity entity;
  CompanyEntity? company;
  PersonEntity? person;
  AddressEntity address;
  PhoneEntity phone;
  CustomerMainEntity({
    required this.customer,
    required this.entity,
    required this.company,
    required this.person,
    required this.address,
    required this.phone,
  });
}
