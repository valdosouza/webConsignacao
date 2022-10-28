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

  factory CustomerMainModel.mock(int index) {
    return CustomerMainModel(
      id: 2,
      tbInstitutionId: 1,
      customer: CustomerModel(
        tbSalesmanId: 1,
        tbCarrierId: 1,
        creditStatus: "teste",
        creditValue: 10.0,
        wallet: "teste",
        consumer: "teste",
        multiplier: 10.0,
        active: "S",
      ),
      entity: CustomerBusinessModel(
        nameCompany: "Teste",
        nickTrade: "Nick Teste",
        tbLineBuinessId: 1,
        aniversary: "teste",
        note: "teste",
      ),
      company: CustomerCompanyModel(
        cnpj: "0976543221",
        dtFoundation: "teste",
        ie: "teste",
        iest: "teste",
        indIeDestinatario: "teste",
      ),
      person: CustomerPersonModel(
        birthday: "teste",
        cpf: "123456789$index",
        rg: "teste",
        rgDtEmission: "teste",
        rgOrganIssuer: "teste",
        rgStateIssuer: "teste",
        tbProfessionId: "teste",
      ),
      address: CustomerAddressModel(
        addressKind: "teste",
        cityName: "teste",
        complement: "teste",
        countryName: "teste",
        latitude: "teste",
        longitude: "teste",
        main: "N",
        neighborhood: "teste",
        nmbr: "teste",
        region: "teste",
        stateName: "teste",
        street: "teste",
        tbCityId: 1,
        tbCountryId: 1,
        tbStateId: 1,
      ),
      phone: CustomerPhoneModel(
          addressKind: "teste",
          contact: "teste",
          kind: "teste",
          number: "12312665432"),
    );
  }
}
