import 'dart:convert';

import 'package:appweb/app/modules/collaborator_register/domain/entity/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel(
      {String? cnpj,
      String? ie,
      String? iest,
      String? dtFoundation,
      String? indIeDestinatario})
      : super(
            cnpj: cnpj ?? "",
            ie: ie ?? "",
            iest: iest ?? "",
            dtFoundation: dtFoundation ?? "",
            indIeDestinatario: indIeDestinatario ?? "");

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnpj': cnpj,
      'ie': ie,
      'iest': iest,
      'dtFoundation': dtFoundation,
      'indIeDestinatario': indIeDestinatario,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      cnpj: map['cnpj'] as String,
      ie: map['ie'] as String,
      iest: map['iest'] as String,
      dtFoundation: map['dtFoundation'] as String,
      indIeDestinatario: map['indIeDestinatario'] as String,
    );
  }

  factory CompanyModel.fromMapRemoteAPI(Map<String, dynamic> map) {
    return CompanyModel(
      cnpj: map['cnpj'] as String,
      ie: map['ie'] as String,
      iest: map['iest'] as String,
      dtFoundation: map['abertura'] as String,
      indIeDestinatario: map['indIeDestinatario'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CompanyModel.fromJsonRemoteAPI(String source) =>
      CompanyModel.fromMapRemoteAPI(json.decode(source) as Map<String, dynamic>);
}
