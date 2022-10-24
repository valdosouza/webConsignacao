import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';

// ignore: must_be_immutable
class IdentificationModel extends IdentificationEntity {
  IdentificationModel({
    String? cnpj,
    String? fantasia,
    String? nome,
    String? logradouro,
    String? numero,
    String? complemento,
    String? municipio,
    String? bairro,
    String? uf,
    String? cep,
  }) : super(
          cnpj: cnpj ?? "",
          fantasia: fantasia ?? "",
          nome: nome ?? "",
          logradouro: logradouro ?? "",
          numero: numero ?? "",
          complemento: complemento ?? "",
          municipio: municipio ?? "",
          bairro: bairro ?? "",
          uf: uf ?? "",
          cep: cep ?? "",
        );

  factory IdentificationModel.fromJson(Map<String, dynamic> json) {
    return IdentificationModel(
      cnpj: json['cnpj'],
      fantasia: json['fantasia'],
      nome: json['nome'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      complemento: json['complemento'],
      municipio: json['municipio'],
      bairro: json['bairro'],
      uf: json['uf'],
      cep: json['cep'],
    );
  }
}
