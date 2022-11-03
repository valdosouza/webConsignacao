// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  String cnpj;
  String ie;
  String iest;
  String dtFoundation;
  String indIeDestinatario;

  CompanyEntity({
    this.cnpj = "",
    this.ie = "",
    this.iest = "",
    this.dtFoundation = "",
    this.indIeDestinatario = "",
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [cnpj];  
}
