import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) : super(
          cep: cep ?? "",
          logradouro: logradouro ?? "",
          complemento: complemento ?? "",
          bairro: bairro ?? "",
          localidade: localidade ?? "",
          uf: uf ?? "",
          ibge: ibge ?? "",
          gia: gia ?? "",
          ddd: ddd ?? "",
          siafi: siafi ?? "",
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }
}
