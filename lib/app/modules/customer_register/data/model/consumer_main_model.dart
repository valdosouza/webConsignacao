import 'package:appweb/app/modules/customer_register/data/model/customer_address_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_business_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_company_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_person_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_phone_model.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_main_entity.dart';

class CustomerMainModel extends CustomerMainEntity {
  CustomerMainModel({
    required int id,
    required int tbInstitutionId,
    required CustomerModel customer,
    required CustomerBusinessModel entity,
    required CustomerCompanyModel company,
    required CustomerPersonModel person,
    required CustomerAddressModel address,
    required CustomerPhoneModel phone,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          customer: customer,
          entity: entity,
          company: company,
          person: person,
          address: address,
          phone: phone,
        );

  factory CustomerMainModel.fromJson(Map<String, dynamic> json) {
    return CustomerMainModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      customer: CustomerModel.fromJson(json['customer']),
      entity: CustomerBusinessModel.fromJson(json['entity']),
      company: CustomerCompanyModel.fromJson(json['company']),
      person: CustomerPersonModel.fromJson(json['person']),
      address: CustomerAddressModel.fromJson(json['address']),
      phone: CustomerPhoneModel.fromJson(json['phone']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['entity'] = customer.toJson();
    data['customer'] = entity.toJson();
    data['company'] = company.toJson();
    data['person'] = person.toJson();
    data['address'] = address.toJson();
    data['phone'] = phone.toJson();
    return data;
  }
}
