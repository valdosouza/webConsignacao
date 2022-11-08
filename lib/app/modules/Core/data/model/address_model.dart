import 'package:appweb/app/modules/Core/domain/entity/address_entity.dart';

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
  factory AddressModel.fromApiCep(Map<String?, dynamic> json) {
    return AddressModel(
      id: 0,
      street: json['logradouro'] as String? ?? "",
      nmbr: "",
      neighborhood: json['bairro'] as String? ?? "",
      region: "",
      complement: json['complemento'] as String? ?? "",
      kind: "",
      zipCode: json['cep'] as String? ?? "",
      tbCountryId: 1058,
      countryName: "Brasil",
      tbStateId: json['tb_state_id'] as int? ?? 0,
      stateName: json['uf'] as String? ?? "",
      tbCityId: json['tb_city_id'] as int? ?? 0,
      cityName: json['localidade'] as String? ?? "",
      main: "S",
      longitude: "",
      latitude: "",
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['street'] = street;
    data['nmbr'] = nmbr;
    data['neighborhood'] = neighborhood;
    data['region'] = region;
    data['complement'] = complement;
    data['kind'] = kind;
    data['tb_country_id'] = tbCountryId;
    data['name_country'] = countryName;
    data['tb_state_id'] = tbStateId;
    data['name_state'] = stateName;
    data['tb_city_id'] = tbCityId;
    data['name_city'] = cityName;
    data['zip_code'] = zipCode;
    data['main'] = main;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }

  factory AddressModel.empty() {
    return AddressModel(
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
    );
  }
}
