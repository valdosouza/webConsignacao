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
    this.kind = "Comercial",
    this.tbCountryId = 1058,
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
}
