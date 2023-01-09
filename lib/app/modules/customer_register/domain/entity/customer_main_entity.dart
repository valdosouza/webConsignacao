import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/data/model/company_model.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/person_model.dart';
import 'package:appweb/app/modules/Core/data/model/phone_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_model.dart';

class CustomerMainEntity {
  CustomerModel customer;
  EntityListModel entity;
  CompanyModel? company;
  PersonModel? person;
  AddressModel address;
  PhoneModel phone;
  CustomerMainEntity({
    required this.customer,
    required this.entity,
    required this.company,
    required this.person,
    required this.address,
    required this.phone,
  });
}
