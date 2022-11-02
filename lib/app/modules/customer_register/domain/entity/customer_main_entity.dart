import 'package:appweb/app/modules/customer_register/domain/entity/customer_address_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_business_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_company_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_person_entity.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_phone_entity.dart';

class CustomerMainEntity {
  CustomerEntity customer;
  CustomerBusinessEntity entity;
  CustomerCompanyEntity? company;
  CustomerPersonEntity? person;
  CustomerAddressEntity address;
  CustomerPhoneEntity phone;

  CustomerMainEntity({
    required this.customer,
    required this.entity,
    required this.company,
    required this.person,
    required this.address,
    required this.phone,
  });
}
