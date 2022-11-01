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
      'address_kind': addressKind,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      kind: map['kind'] != null ?  map['kind'] as String : "",
      contact: map['contact'] != null ? map['contact'] as String : "",
      number: map['number'] != null ? map['number'] as String : "",
      addressKind: map['address_kind'] != null ? map['address_kind'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
