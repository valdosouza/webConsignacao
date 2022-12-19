import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class IdentificationCompanyEntity extends Equatable {
  String cnpj;
  String nickTtrade;
  String nameCompany;
  String street;
  String nmbr;
  String complement;
  String neighborhood;
  String zipCode;
  int tbCountryId;
  String countryName;
  int tbStateId;
  String stateName;
  int tbCityId;
  String cityName;
  String kind;

  IdentificationCompanyEntity({
    this.cnpj = "",
    this.nickTtrade = "",
    this.nameCompany = "",
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.neighborhood = "",
    this.zipCode = "",
    this.tbCountryId = 0,
    this.countryName = "",
    this.tbStateId = 0,
    this.stateName = "",
    this.tbCityId = 0,
    this.cityName = "",
    this.kind = "Comercial",
  });

  @override
  List<Object?> get props => [cnpj];
}
