import 'package:appweb/app/modules/customer_register/domain/entity/customer_phone_entity.dart';

class CustomerPhoneModel extends CustomerPhoneEntity {
  CustomerPhoneModel({
    String? kind,
    String? contact,
    String? number,
    String? addressKind,
  }) : super(
          kind: kind = "",
          contact: contact = "",
          number: number = "",
          addressKind: addressKind = "",
        );

  factory CustomerPhoneModel.fromJson(Map<String, dynamic> json) {
    return CustomerPhoneModel(
      kind: json['kind'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      number: json['number'] as String? ?? "",
      addressKind: json['addressKind'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['contact'] = contact;
    data['number'] = number;
    data['addressKind'] = addressKind;
    return data;
  }
}
