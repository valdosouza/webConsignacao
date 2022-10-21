import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  AddressEntity(
      {this.cep = "",
      this.logradouro = "",
      this.complemento = "",
      this.bairro = "",
      this.localidade = "",
      this.uf = "",
      this.ibge = "",
      this.gia = "",
      this.ddd = "",
      this.siafi = ""});

  @override
  List<Object?> get props => [cep, uf, ibge];
}
