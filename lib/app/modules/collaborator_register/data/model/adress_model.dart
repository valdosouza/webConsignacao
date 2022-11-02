import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/address_entity.dart';

// ignore: must_be_immutable
class AddressModel extends AddressEntity {
  AddressModel(
      {int? id,
      String? zipCode,
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
            id: id ?? 0,
            zipCode: zipCode ?? "",
            street: street ?? "",
            complement: complement ?? "",
            neighborhood: neighborhood ?? "",
            region: region ?? "",
            kind: kind ?? "",
            nmbr: nmbr ?? "",
            main: main ?? "S",
            countryName: countryName ?? "",
            tbCountryId: tbCountryId ?? 1058,
            stateName: stateName ?? "",
            tbStateId: tbStateId ?? 0,
            cityName: cityName ?? "",
            tbCityId: tbCityId ?? 0,
            latitude: latitude ?? "",
            longitude: longitude ?? "");

  Map<String, dynamic> toMap() {
    Map<String, dynamic> address = <String, dynamic>{};

    address['id'] = id;
    address['zip_code'] = zipCode;
    address['street'] = street;
    address['complement'] = complement;
    address['neighborhood'] = neighborhood;
    address['region'] = region;
    address['kind'] = kind;
    address['nmbr'] = nmbr;
    address['main'] = main;
    address['name_country'] = countryName;
    address['tb_country_id'] = tbCountryId;
    address['name_state'] = stateName;
    address['tb_state_id'] = tbStateId;
    address['name_city'] = cityName;
    address['tb_city_id'] = tbCityId;
    address['latitude'] = latitude;
    address['longitude'] = longitude;

    return address;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] != null ? map['id'] as int : 0,
      zipCode: map['zip_code'] != null ? map['zip_code'] as String : null,
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
          map['country_name'] != null ? map['country_name'] as String : null,
      tbCountryId:
          map['tb_country_id'] != null ? map['tb_country_id'] as int : null,
      stateName: map['name_state'] != null ? map['name_state'] as String : null,
      tbStateId: map['tb_state_id'] != null ? map['tb_state_id'] as int : null,
      cityName: map['name_city'] != null ? map['name_city'] as String : null,
      tbCityId: map['tb_city_id'] != null ? map['tb_city_id'] as int : null,
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
        cityName: map['localidade'] as String);
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AddressModel.fromJsonRemoteAPI(String source) =>
      AddressModel.fromMapRemoteAPI(
          json.decode(source) as Map<String, dynamic>);
}
