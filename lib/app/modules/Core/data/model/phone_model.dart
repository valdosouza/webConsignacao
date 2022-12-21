import 'package:appweb/app/modules/Core/domain/entity/phone_entity.dart';

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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kind'] = kind;
    data['contact'] = contact;
    data['number'] = number
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("-", "")
        .replaceAll(" ", "");
    data['address_kind'] = addressKind;
    return data;
  }

  factory PhoneModel.empty() {
    return PhoneModel(
      id: 0,
      kind: "Comercial",
      addressKind: "Comercial",
      contact: "",
      number: "",
    );
  }
}
