import 'package:appweb/app/core/domain/entity/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    int? id,
    String? street,
    String? nmbr,
    String? complement,
    String? neighborhood,
    String? region,
    String? kind,
    String? zipCode,
    int? tbCountryId,
    String? countryName,
    int? tbStateId,
    String? stateName,
    int? tbCityId,
    String? cityName,
    String? main,
    String? longitude,
    String? latitude,
  }) : super(
          id: id ?? 0,
          street: street ?? "",
          nmbr: nmbr ?? "",
          complement: complement ?? "",
          neighborhood: neighborhood ?? "",
          region: region ?? "",
          kind: kind ?? "",
          tbCountryId: tbCountryId ?? 0,
          countryName: countryName ?? "",
          tbStateId: tbStateId ?? 0,
          stateName: stateName ?? "",
          tbCityId: tbCityId ?? 0,
          cityName: cityName ?? "",
          main: main ?? "",
          zipCode: zipCode ?? "",
          longitude: longitude ?? "",
          latitude: latitude ?? "",
        );

  factory AddressModel.fromJson(Map<String?, dynamic> json) {
    return AddressModel(
      id: json['id'] as int? ?? 0,
      street: json['street'] as String? ?? "",
      nmbr: json['nmbr'] as String? ?? "",
      neighborhood: json['neighborhood'] as String? ?? "",
      region: json['region'] as String? ?? "",
      complement: json['complement'] as String? ?? "",
      kind: json['address_kind'] as String? ?? "",
      zipCode: json['zip_code'] as String? ?? "",
      tbCountryId: json['tb_country_id'] as int? ?? 0,
      countryName: json['name_country'] as String? ?? "",
      tbStateId: json['tb_state_id'] as int? ?? 0,
      stateName: json['name_state'] as String? ?? "",
      tbCityId: json['tb_city_id'] as int? ?? 0,
      cityName: json['name_city'] as String? ?? "",
      main: json['main'] as String? ?? "",
      longitude: json['longitude'] as String? ?? "",
      latitude: json['latitude'] as String? ?? "",
    );
  }
}
