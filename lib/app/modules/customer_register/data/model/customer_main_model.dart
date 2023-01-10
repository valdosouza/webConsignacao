import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/data/model/company_model.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/person_model.dart';
import 'package:appweb/app/modules/Core/data/model/phone_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_model.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_main_entity.dart';

class CustomerMainModel extends CustomerMainEntity {
  CustomerMainModel({
    required CustomerModel customer,
    required EntityListModel entity,
    CompanyModel? company,
    PersonModel? person,
    required AddressModel address,
    required PhoneModel? phone,
  }) : super(
          customer: customer,
          entity: entity,
          company: company,
          person: person,
          address: address,
          phone: phone,
        );

  factory CustomerMainModel.fromJson(Map<String, dynamic> json) {
    CustomerModel retcustomer = CustomerModel.fromJson(json['customer']);
    EntityListModel retentity = EntityListModel.fromJson(json['entity']);
    return CustomerMainModel(
      customer: retcustomer,
      entity: retentity,
      company: json['company'] != null
          ? CompanyModel.fromJson(json['company'])
          : null,
      person:
          json['person'] != null ? PersonModel.fromJson(json['person']) : null,
      address: AddressModel.fromJson(json['address']),
      phone:
          json['phone'].length > 0 ? PhoneModel.fromJson(json['phone']) : null,
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['customer'] = customer.toJson();
    data['entity'] = entity.toJson();
    data['company'] = company?.toJson();
    data['person'] = person?.toJson();
    data['address'] = address.toJson();
    data['phone'] = phone?.toJson();
    return data;
  }

  factory CustomerMainModel.empty() {
    return CustomerMainModel(
        customer: CustomerModel.empty(),
        entity: EntityListModel.empty(),
        company: CompanyModel.empty(),
        person: PersonModel.empty(),
        address: AddressModel.empty(),
        phone: PhoneModel.empty());
  }
}
