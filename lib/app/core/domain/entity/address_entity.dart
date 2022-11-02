class AddressEntity {
  int id;
  String street;
  String nmbr;
  String complement;
  String neighborhood;
  String region;
  String kind;
  int tbCountryId;
  String countryName;
  int tbStateId;
  String stateName;
  int tbCityId;
  String zipCode;
  String cityName;
  String main;
  String longitude;
  String latitude;

  AddressEntity({
    this.id = 0,
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.neighborhood = "",
    this.region = "",
    this.kind = "",
    this.tbCountryId = 0,
    this.countryName = "",
    this.tbStateId = 0,
    this.stateName = "",
    this.tbCityId = 0,
    this.cityName = "",
    this.zipCode = "",
    this.main = "",
    this.longitude = "",
    this.latitude = "",
  });

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
}
