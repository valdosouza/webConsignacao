import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  PhoneModel(
      {String? kind, String? contact, String? number, String? addressKind})
      : super(
            kind: kind ?? "",
            contact: contact ?? "",
            number: number ?? "",
            addressKind: addressKind ?? "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'contact': contact,
      'number': number,
      'addressKind': addressKind,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      kind: map['kind'] as String,
      contact: map['contact'] as String,
      number: map['number'] as String,
      addressKind: map['addressKind'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
