// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddressEntity extends Equatable {
  String zipCode;
  String street;
  String complement;
  String neighborhood;
  String region;
  String kind;
  String nmbr;
  String main;
  String countryName;
  int tbCountryId;
  String stateName;
  int tbStateId;
  String cityName;
  int tbCityId;
  String latitude;
  String longitude;

  AddressEntity({
    this.zipCode = "",
    this.street = "",
    this.complement = "",
    this.neighborhood = "",
    this.region = "",
    this.kind = "",
    this.nmbr = "",
    this.main = "",
    this.countryName = "",
    this.tbCountryId = 0,
    this.cityName = "",
    this.tbCityId = 0,
    this.stateName = "",
    this.tbStateId = 0,
    this.latitude = "",
    this.longitude = "",
  });

  @override
  List<Object?> get props => [zipCode, street, region];
}
