// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class EntityEntity extends Equatable {
  String nameCompany;
  String nickTrade;
  int tbLineBussinessId;
  String nameLineBussiness;
  String aniversary;
  String note;

  EntityEntity({
    this.nameCompany = "",
    this.nickTrade = "",
    this.tbLineBussinessId = 0,
    this.nameLineBussiness = "",
    this.aniversary = "",
    this.note = "",
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [nickTrade];
}
