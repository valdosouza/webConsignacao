import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class InstitutionEntity extends Equatable {
  int id;
  String nameCompany;
  String nickTrade;
  String tbLineBuinessId;
  String note;
  String active;
  String cnpj;
  String ie;
  String im;
  String iest;
  String dtFoundation;
  String crt;
  String crtModal;
  String indIeDestinatario;
  String issIndExig;
  String issRetencao;
  String issIncFiscal;
  String issProcessNumber;
  String sendXmlNfeOnly;
  String street;
  String nmbr;
  String complement;
  String neighborhood;
  String region;
  String addressKind;
  String zipCode;
  int tbCountryId;
  String nameCountry;
  int tbStateId;
  String nameState;
  int tbCityId;
  String nameCity;
  String main;
  String longitude;
  String latitude;
  String phoneKind;
  String phoneNumber;

  InstitutionEntity({
    this.id = 0,
    this.nameCompany = "",
    this.nickTrade = "",
    this.tbLineBuinessId = "",
    this.note = "",
    this.active = "",
    this.cnpj = "",
    this.ie = "",
    this.im = "",
    this.iest = "",
    this.dtFoundation = "",
    this.crt = "",
    this.crtModal = "",
    this.indIeDestinatario = "",
    this.issIndExig = "",
    this.issRetencao = "",
    this.issIncFiscal = "",
    this.issProcessNumber = "",
    this.sendXmlNfeOnly = "",
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.neighborhood = "",
    this.region = "",
    this.addressKind = "",
    this.zipCode = "",
    this.tbCountryId = 0,
    this.nameCountry = "",
    this.tbStateId = 0,
    this.nameState = "",
    this.tbCityId = 0,
    this.nameCity = "",
    this.main = "",
    this.longitude = "",
    this.latitude = "",
    this.phoneKind = "",
    this.phoneNumber = "",
  });

  @override
  List<Object?> get props => [id, cnpj, nameCompany, ie];

  @override
  String toString() {
    return "InstitutionEntity: id: $id, nameCompany: $nameCompany, nickTrade: $nickTrade, tbLineBuinessId: $tbLineBuinessId,  note: $note, active: $active, cnpj: $cnpj, ie: $ie, im: $im, iest: $iest, dtFoundation: $dtFoundation, crt: $crt, crtModal: $crtModal, indIeDestinatario: $indIeDestinatario, issIndExig: $issIndExig, issRetencao: $issRetencao, issIncFiscal: $issIncFiscal, issProcessNumber: $issProcessNumber, sendXmlNfeOnly: $sendXmlNfeOnly, street: $street, nmbr: $nmbr, complement: $complement";
  }
}
