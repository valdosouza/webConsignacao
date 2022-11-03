import 'package:appweb/app/core/data/model/address_model.dart';
import 'package:appweb/app/core/data/model/entity_model.dart';
import 'package:appweb/app/core/data/model/company_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_model.dart';
import 'package:appweb/app/core/data/model/person_model.dart';
import 'package:appweb/app/core/data/model/phone_model.dart';
import 'package:appweb/app/modules/customer_register/domain/entity/customer_main_entity.dart';

class CustomerMainModel extends CustomerMainEntity {
  CustomerMainModel({
    required CustomerModel customer,
    required EntityModel entity,
    CompanyModel? company,
    PersonModel? person,
    required AddressModel address,
    required PhoneModel phone,
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
    EntityModel retentity = EntityModel.fromJson(json['entity']);
    return CustomerMainModel(
      customer: retcustomer,
      entity: retentity,
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
    data['customer'] = customer.toJson();
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
        creditValue: 0,
        wallet: "",
        consumer: "",
        multiplier: 0,
        active: "N",
      ),
      entity: EntityModel(
        id: 0,
        nameCompany: "",
        nickTrade: "",
        tbLineBusinessId: 1,
        aniversary: "",
        note: "",
      ),
      company: CompanyModel(
        id: 0,
        cnpj: "",
        dtFoundation: "",
        ie: "",
        iest: "",
        indIeDestinatario: "",
      ),
      person: PersonModel(
        id: 0,
        birthday: "",
        cpf: "",
        rg: "",
        rgDtEmission: "",
        rgOrganIssuer: "",
        rgStateIssuer: 0,
        tbProfessionId: 0,
      ),
      address: AddressModel(
        id: 0,
        kind: "",
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
      phone: PhoneModel(addressKind: "", contact: "", kind: "", number: ""),
    );
  }
}
