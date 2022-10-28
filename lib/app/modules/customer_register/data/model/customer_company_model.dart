import 'package:appweb/app/modules/customer_register/domain/entity/customer_company_entity.dart';

class CustomerCompanyModel extends CustomerCompanyEntity {
  CustomerCompanyModel({
    String? cnpj,
    String? ie,
    String? iest,
    String? dtFoundation,
    String? indIeDestinatario,
  }) : super(
          cnpj: cnpj = "",
          ie: ie = "",
          iest: iest = "",
          dtFoundation: dtFoundation = "",
          indIeDestinatario: indIeDestinatario = "",
        );

  factory CustomerCompanyModel.fromJson(Map<String, dynamic> json) {
    return CustomerCompanyModel(
      cnpj: json['cnpj'] as String? ?? "",
      ie: json['ie'] as String? ?? "",
      iest: json['iest'] as String? ?? "",
      dtFoundation: json['dt_foundation'] as String? ?? "",
      indIeDestinatario: json['ind_ie_destinatario'] as String? ?? "",
    );
  }
}
