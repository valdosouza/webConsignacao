// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PhoneEntity extends Equatable {
  int id;
  String kind;
  String contact;
  String number;
  String addressKind;
  PhoneEntity({
    this.id = 0,
    this.kind = "",
    this.contact = "",
    this.number = "",
    this.addressKind = "",
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
