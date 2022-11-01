import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/address_entity.dart';

// ignore: must_be_immutable
class AddressModel extends AddressEntity {
  AddressModel(
      {String? zipCode,
      String? street,
      String? complement,
      String? neighborhood,
      String? region,
      String? kind,
      String? nmbr,
      String? main,
      String? countryName,
      int? tbCountryId,
      String? stateName,
      int? tbStateId,
      String? cityName,
      int? tbCityId,
      String? latitude,
      String? longitude})
      : super(
            zipCode: zipCode ?? "",
            street: street ?? "",
            complement: complement ?? "",
            neighborhood: neighborhood ?? "",
            region: region ?? "",
            kind: kind ?? "",
            nmbr: nmbr ?? "",
            main: main ?? "",
            countryName: countryName ?? "",
            tbCountryId: tbCountryId ?? 0,
            stateName: stateName ?? "",
            tbStateId: tbStateId ?? 0,
            cityName: cityName ?? "",
            tbCityId: tbCityId ?? 0,
            latitude: latitude ?? "",
            longitude: longitude ?? "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zip_code': zipCode,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'region': region,
      'kind': kind,
      'nmbr': nmbr,
      'main': main,
      'name_country': countryName,
      'tb_country_id': tbCountryId,
      'name_state': stateName,
      'tb_state_id': tbStateId,
      'name_city': cityName,
      'tb_city_id': tbCityId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['zipCode'] != null ? map['zipCode'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      complement:
          map['complement'] != null ? map['complement'] as String : null,
      neighborhood:
          map['neighborhood'] != null ? map['neighborhood'] as String : null,
      region: map['region'] != null ? map['region'] as String : null,
      kind: map['kind'] != null ? map['kind'] as String : null,
      nmbr: map['nmbr'] != null ? map['nmbr'] as String : null,
      main: map['main'] != null ? map['main'] as String : null,
      countryName:
          map['countryName'] != null ? map['countryName'] as String : null,
      tbCountryId:
          map['tbCountryId'] != null ? map['tbCountryId'] as int : null,
      stateName: map['stateName'] != null ? map['stateName'] as String : null,
      tbStateId: map['tbStateId'] != null ? map['tbStateId'] as int : null,
      cityName: map['cityName'] != null ? map['cityName'] as String : null,
      tbCityId: map['tbCityId'] != null ? map['tbCityId'] as int : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
    );
  }
  factory AddressModel.fromMapRemoteAPI(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'] as String,
      street: map['logradouro'] as String,
      complement: map['complemento'] as String,
      neighborhood: map['bairro'] as String,
      stateName: map['uf'] as String,
      cityName: map['localidade'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AddressModel.fromJsonRemoteAPI(String source) =>
      AddressModel.fromMapRemoteAPI(
          json.decode(source) as Map<String, dynamic>);
}
