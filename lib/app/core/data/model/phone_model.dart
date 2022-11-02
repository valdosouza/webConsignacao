import 'package:appweb/app/core/domain/entity/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  PhoneModel({
    int? id,
    String? kind,
    String? contact,
    String? number,
    String? addressKind,
  }) : super(
          id: id ?? 0,
          kind: kind ?? "",
          contact: contact ?? "",
          number: number ?? "",
          addressKind: addressKind ?? "",
        );

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'] as int? ?? 0,
      kind: json['kind'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      number: json['number'] as String? ?? "",
      addressKind: json['address_kind'] as String? ?? "",
    );
  }
}
