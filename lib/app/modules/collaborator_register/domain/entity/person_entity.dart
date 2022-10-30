// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  String cpf;
  String rg;
  String rgDtEmission;
  String rgOrganIssuer;
  String rgStateIssuer;
  String birthday;
  int tbProfessionId;
  PersonEntity({
    this.cpf = "",
    this.rg = "",
    this.rgDtEmission = "",
    this.rgOrganIssuer = "",
    this.rgStateIssuer = "",
    this.birthday = "",
    this.tbProfessionId = 0,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [cpf, rg];
}
