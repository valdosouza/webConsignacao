import 'package:appweb/app/core/domain/entity/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    int? id,
    String? cnpj,
    String? ie,
    String? iest,
    String? dtFoundation,
    String? indIeDestinatario,
  }) : super(
          id: id ?? 0,
          cnpj: cnpj ?? "",
          ie: ie ?? "",
          iest: iest ?? "",
          dtFoundation: dtFoundation ?? "",
          indIeDestinatario: indIeDestinatario ?? "",
        );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] as int? ?? 0,
      cnpj: json['cnpj'] as String? ?? "",
      ie: json['ie'] as String? ?? "",
      iest: json['iest'] as String? ?? "",
      dtFoundation: json['dt_foundation'] as String? ?? "",
      indIeDestinatario: json['ind_ie_destinatario'] as String? ?? "",
    );
  }
}
