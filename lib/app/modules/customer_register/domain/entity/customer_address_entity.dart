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
    this.main = "",
    this.longitude = "",
    this.latitude = "",
  });
}
