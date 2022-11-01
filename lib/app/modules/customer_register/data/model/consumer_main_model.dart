import 'package:appweb/app/modules/customer_register/data/model/customer_address_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_business_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_company_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_person_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_phone_model.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_main_entity.dart';

class CustomerMainModel extends CustomerMainEntity {
  CustomerMainModel({
    required CustomerModel customer,
    required CustomerBusinessModel entity,
    CustomerCompanyModel? company,
    CustomerPersonModel? person,
    required CustomerAddressModel address,
    required CustomerPhoneModel phone,
  }) : super(
          customer: customer,
          entity: entity,
          company: company,
          person: person,
          address: address,
          phone: phone,
        );

  factory CustomerMainModel.fromJson(Map<String, dynamic> json) {
    return CustomerMainModel(
      customer: CustomerModel.fromJson(json['custommer']),
      entity: CustomerBusinessModel.fromJson(json['entity']),
      company: json['company'] != null
          ? CustomerCompanyModel.fromJson(json['company'])
          : null,
      person: json['person'] != null
          ? CustomerPersonModel.fromJson(json['person'])
          : null,
      address: CustomerAddressModel.fromJson(json['address']),
      phone: CustomerPhoneModel.fromJson(json['phone']),
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['custommer'] = customer.toJson();
    data['entity'] = entity.toJson();
    data['company'] = company?.toJson();
    data['person'] = person?.toJson();
    data['address'] = address.toJson();
    data['phone'] = phone.toJson();
    return data;
  }

  factory CustomerMainModel.empty() {
    return CustomerMainModel(
      customer: CustomerModel(
        id: 0,
        tbInstitutionId: 1,
        tbSalesmanId: 1,
        tbCarrierId: 1,
        creditStatus: "",
        creditValue: "",
        wallet: "",
        consumer: "",
        multiplier: "",
        active: "N",
      ),
      entity: CustomerBusinessModel(
        nameCompany: "",
        nickTrade: "",
        tbLineBuinessId: 1,
        aniversary: "",
        note: "",
      ),
      company: CustomerCompanyModel(
        cnpj: "",
        dtFoundation: "",
        ie: "",
        iest: "",
        indIeDestinatario: "",
      ),
      person: CustomerPersonModel(
        birthday: "",
        cpf: "",
        rg: "",
        rgDtEmission: "",
        rgOrganIssuer: "",
        rgStateIssuer: 0,
        tbProfessionId: 0,
      ),
      address: CustomerAddressModel(
        addressKind: "",
        zipCode: "",
        cityName: "",
        complement: "",
        countryName: "",
        latitude: "",
        longitude: "",
        main: "N",
        neighborhood: "",
        nmbr: "",
        region: "",
        stateName: "",
        street: "",
        tbCityId: 1,
        tbCountryId: 1,
        tbStateId: 1,
      ),
      phone: CustomerPhoneModel(
          addressKind: "", contact: "", kind: "", number: ""),
    );
  }
}
