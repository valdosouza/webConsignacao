import 'package:appweb/app/modules/customer_register/domain/entity/customer_address_entity.dart';

class CustomerAddressModel extends CustomerAddressEntity {
  CustomerAddressModel({
    String? street,
    String? nmbr,
    String? complement,
    String? neighborhood,
    String? region,
    String? addressKind,
    int? tbCountryId,
    String? countryName,
    int? tbStateId,
    String? stateName,
    int? tbCityId,
    String? cityName,
    String? main,
    String? longitude,
    String? latitude,
  }) : super(
          street: street = "",
          nmbr: nmbr = "",
          complement: complement = "",
          neighborhood: neighborhood = "",
          region: region = "",
          addressKind: addressKind = "",
        );

  // factory CustomerAddressModel.fromJson(Map<String?, dynamic> json) {
  //   return CustomerAddressModel(
  //     kind: json['kind'] as String? ?? "",
  //     contact: json['contact'] as String? ?? "",
  //     number: json['number'] as String? ?? "",
  //     addressKind: json['address_kind'] as String? ?? "",
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['kind'] = kind;
  //   data['contact'] = contact;
  //   data['number'] = number;
  //   data['address_kind'] = addressKind;
  //   return data;
  // }
}
