class CustomerAddressEntity {
  String street;
  String nmbr;
  String complement;
  String neighborhood;
  String region;
  String addressKind;
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

  CustomerAddressEntity({
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.neighborhood = "",
    this.region = "",
    this.addressKind = "",
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
    data['street'] = street;
    data['nmbr'] = nmbr;
    data['neighborhood'] = neighborhood;
    data['region'] = region;
    data['complement'] = complement;
    data['address_kind'] = addressKind;
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
