import 'package:flutter/material.dart';

class PaymentModel {
  final String id;
  final String idInstitution;
  final String description;
  final bool active;

  PaymentModel(
      {required this.id,
      required this.idInstitution,
      required this.description,
      required this.active});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
        id: json['id'].toString(),
        idInstitution: json['tb_institution_id'].toString(),
        description: json['description'].toString(),
        active: json['active'].toString() == 'S' ? true : false);
  }

  toMap() {
    return {
      'id': id,
      'tb_institution_id': idInstitution,
      'description': description,
      'active': active ? 'S' : 'N'
    };
  }

  copyWith(
      {String? id, String? idInstitution, String? description, bool? active}) {
    return PaymentModel(
        id: id ?? this.id,
        idInstitution: idInstitution ?? this.idInstitution,
        description: description ?? this.description,
        active: active ?? this.active);
  }
}
