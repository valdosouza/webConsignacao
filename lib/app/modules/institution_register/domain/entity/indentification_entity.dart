import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class IdentificationEntity extends Equatable {
  String cnpj;
  String fantasia;
  String nome;
  String logradouro;
  String numero;
  String complemento;
  String municipio;
  String bairro;
  String uf;
  String cep;

  IdentificationEntity(
      {this.cnpj = "",
      this.fantasia = "",
      this.nome = "",
      this.logradouro = "",
      this.numero = "",
      this.complemento = "",
      this.municipio = "",
      this.bairro = "",
      this.uf = "",
      this.cep = ""});

  @override
  List<Object?> get props => [cnpj];
}
