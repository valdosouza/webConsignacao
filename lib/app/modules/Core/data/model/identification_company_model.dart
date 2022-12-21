import 'package:appweb/app/modules/Core/domain/entity/identification_company_entity.dart';

// ignore: must_be_immutable
class IdentificationCompanyModel extends IdentificationCompanyEntity {
  IdentificationCompanyModel({
    String? cnpj,
    String? nickTrade,
    String? nameCompany,
    String? street,
    String? nmbr,
    String? complement,
    String? neighborhood,
    String? zipCode,
    int? tbCountryId,
    String? countryName,
    int? tbStateId,
    String? stateName,
    int? tbCityId,
    String? cityName,
    String? kind,
  }) : super(
          cnpj: cnpj ?? "",
          nickTtrade: nickTrade ?? "",
          nameCompany: nameCompany ?? "",
          street: street ?? "",
          nmbr: nmbr ?? "",
          complement: complement ?? "",
          neighborhood: neighborhood ?? "",
          zipCode: zipCode ?? "",
          tbCountryId: tbCountryId ?? 0,
          countryName: countryName ?? "",
          tbStateId: tbStateId ?? 0,
          stateName: stateName ?? "",
          tbCityId: tbCityId ?? 0,
          cityName: cityName ?? "",
          kind: "Comercial",
        );

  factory IdentificationCompanyModel.fromJson(Map<String, dynamic> json) {
    return IdentificationCompanyModel(
      cnpj: json['cnpj'],
      nickTrade: json['fantasia'],
      nameCompany: json['nome'],
      street: json['logradouro'] as String? ?? "",
      nmbr: json['numero'],
      complement: json['complemento'] as String? ?? "",
      neighborhood: json['bairro'],
      zipCode: json['cep'] as String? ?? "",
      tbCountryId: 1058,
      countryName: "Brasil",
      tbStateId: json['tb_state_id'] as int? ?? 0,
      stateName: json['uf'] as String? ?? "",
      tbCityId: json['tb_city_id'] as int? ?? 0,
      cityName: json['municipio'] as String? ?? "",
      kind: "Comercial",
    );
  }
}
