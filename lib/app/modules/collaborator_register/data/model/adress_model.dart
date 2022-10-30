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
      'zipCode': zipCode,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'region': region,
      'kind': kind,
      'nmbr': nmbr,
      'main': main,
      'countryName': countryName,
      'tbCountryId': tbCountryId,
      'stateName': stateName,
      'tbStateId': tbStateId,
      'cityName': cityName,
      'tbCityId': tbCityId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['zipCode'] as String,
      street: map['street'] as String,
      complement: map['complement'] as String,
      neighborhood: map['neighborhood'] as String,
      region: map['region'] as String,
      kind: map['kind'] as String,
      nmbr: map['nmbr'] as String,
      main: map['main'] as String,
      countryName: map['countryName'] as String,
      tbCountryId: map['tbCountryId'] as int,
      stateName: map['stateName'] as String,
      tbStateId: map['tbStateId'] as int,
      cityName: map['cityName'] as String,
      tbCityId: map['tbCityId'] as int,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }
  factory AddressModel.fromMapRemoteAPI(Map<String, dynamic> map) {
    return AddressModel(
      zipCode: map['cep'] as String,
      street: map['logradouro'] as String,
      complement: map['complemento'] as String,
      neighborhood: map['bairro'] as String,
      nmbr: map['numero'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
  
  factory AddressModel.fromJsonRemoteAPI(String source) => AddressModel.fromMapRemoteAPI(json.decode(source) as Map<String, dynamic>);
}
