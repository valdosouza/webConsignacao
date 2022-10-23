import 'package:appweb/app/modules/payment/domain/entities/payment_entity.dart';
import 'package:flutter/material.dart';

class PaymentModel extends PaymentEntity{
 
   PaymentModel({
    required int id,
    required int idInstitution,
    required String description,
    required bool active,
  }) : super(
            id: id,
            idInstitution: idInstitution,
            description: description,
            active: active);


  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
        id: json['id'],
        idInstitution: json['tb_institution_id'],
        description: json['description'].toString(),
        active: json['active'].toString() == 'S' ? true : false);
  }

  toMap() {
    return {
      'id': id.toString(),
      'tb_institution_id': idInstitution.toString(),
      'description': description,
      'active': active ? 'S' : 'N'
    };
  }

  copyWith(
      {int? id, int? idInstitution, String? description, bool? active}) {
    return PaymentModel(
        id: id ?? this.id,
        idInstitution: idInstitution ?? this.idInstitution,
        description: description ?? this.description,
        active: active ?? this.active);
  }
}
