import 'package:appweb/app/modules/customer_register/domain/entity/customer_address_entity.dart';

class CustomerAddressModel extends CustomerAddressEntity {
  CustomerAddressModel({
    String? street,
    String? nmbr,
    String? complement,
    String? neighborhood,
    String? region,
    String? addressKind,
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
          street: street ?? "",
          nmbr: nmbr ?? "",
          complement: complement ?? "",
          neighborhood: neighborhood ?? "",
          region: region ?? "",
          addressKind: addressKind ?? "",
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

  factory CustomerAddressModel.fromJson(Map<String?, dynamic> json) {
    return CustomerAddressModel(
      street: json['street'] as String? ?? "",
      nmbr: json['nmbr'] as String? ?? "",
      neighborhood: json['neighborhood'] as String? ?? "",
      region: json['region'] as String? ?? "",
      complement: json['complement'] as String? ?? "",
      addressKind: json['address_kind'] as String? ?? "",
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