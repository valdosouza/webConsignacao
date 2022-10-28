import 'package:appweb/app/modules/customer_register/domain/entity/customer_phone_entity.dart';

class CustomerPhoneModel extends CustomerPhoneEntity {
  CustomerPhoneModel({
    String? kind,
    String? contact,
    String? number,
    String? addressKind,
  }) : super(
          kind: kind ?? "",
          contact: contact ?? "",
          number: number ?? "",
          addressKind: addressKind ?? "",
        );

  factory CustomerPhoneModel.fromJson(Map<String, dynamic> json) {
    return CustomerPhoneModel(
      kind: json['kind'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      number: json['number'] as String? ?? "",
      addressKind: json['address_kind'] as String? ?? "",
    );
  }
}
