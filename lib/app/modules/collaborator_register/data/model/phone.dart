import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  PhoneModel(
      {int? id,
      String? kind,
      String? contact,
      String? number,
      String? addressKind})
      : super(
            id: id ?? 0,
            kind: kind ?? "",
            contact: contact ?? "",
            number: number ?? "",
            addressKind: addressKind ?? "");

  Map<String, dynamic> toMap() {
    Map<String, dynamic> phone = <String, dynamic>{};
    
    phone['id'] = id;
    phone['kind'] = kind;
    phone['contact'] = contact;
    phone['number'] = number;
    phone['address_kind'] = addressKind;
    
    return phone;
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      id: map['id'] != null ? map['id'] as int : 0,
      kind: map['kind'] != null ? map['kind'] as String : "",
      contact: map['contact'] != null ? map['contact'] as String : "",
      number: map['number'] != null ? map['number'] as String : "",
      addressKind:
          map['address_kind'] != null ? map['address_kind'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
