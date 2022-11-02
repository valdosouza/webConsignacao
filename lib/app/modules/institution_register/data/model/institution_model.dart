import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';

// ignore: must_be_immutable
class InstitutionModel extends InstitutionEntity {
  InstitutionModel({
    required int id,
    required String? nameCompany,
    required String? nickTrade,
    required String? tbLineBuinessId,
    required String? note,
    required String? active,
    required String? cnpj,
    required String? ie,
    required String? im,
    required String? iest,
    required String? dtFoundation,
    required String? crt,
    required String? crtModal,
    required String? indIeDestinatario,
    required String? issIndExig,
    required String? issRetencao,
    required String? issIncFiscal,
    required String? issProcessNumber,
    required String? sendXmlNfeOnly,
    required String? street,
    required String? nmbr,
    required String? complement,
    required String? neighborhood,
    required String? region,
    required String? addressKind,
    required String? zipCode,
    required int tbCountryId,
    required String? nameCountry,
    required int tbStateId,
    required String? nameState,
    required int tbCityId,
    required String? nameCity,
    required String? main,
    required String? longitude,
    required String? latitude,
    required String? phoneKind,
    required String? phoneNumber,
  }) : super(
          id: id,
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBuinessId: tbLineBuinessId ?? "",
          note: note ?? "",
          active: active ?? "",
          cnpj: cnpj ?? "",
          ie: ie ?? "",
          im: im ?? "",
          iest: iest ?? "",
          dtFoundation: dtFoundation ?? "",
          crt: crt ?? "",
          crtModal: crtModal ?? "",
          indIeDestinatario: indIeDestinatario ?? "",
          issIndExig: issIndExig ?? "",
          issRetencao: issRetencao ?? "",
          issIncFiscal: issIncFiscal ?? "",
          issProcessNumber: issProcessNumber ?? "",
          sendXmlNfeOnly: sendXmlNfeOnly ?? "",
          street: street ?? "",
          nmbr: nmbr ?? "",
          complement: complement ?? "",
          neighborhood: neighborhood ?? "",
          region: region ?? "",
          addressKind: addressKind ?? "",
          zipCode: zipCode ?? "",
          tbCountryId: tbCountryId,
          nameCountry: nameCountry ?? "",
          tbStateId: tbStateId,
          nameState: nameState ?? "",
          tbCityId: tbCityId,
          nameCity: nameCity ?? "",
          main: main ?? "",
          longitude: longitude ?? "",
          latitude: latitude ?? "",
          phoneKind: phoneKind ?? "",
          phoneNumber: phoneNumber ?? "",
        );

  factory InstitutionModel.fromJson(Map<String, dynamic> json) {
    return InstitutionModel(
      id: json['id'],
      nameCompany: json['name_company'],
      nickTrade: json['nick_trade'],
      tbLineBuinessId: json['tb_line_buiness_id'],
      note: json['note'],
      active: json['active'],
      cnpj: json['cnpj'],
      ie: json['ie'],
      im: json['im'],
      iest: json['iest'],
      dtFoundation: json['dt_foundation'],
      crt: json['crt'],
      crtModal: json['crt_modal'],
      indIeDestinatario: json['ind_ie_destinatario'],
      issIndExig: json['iss_ind_exig'],
      issRetencao: json['iss_retencao'],
      issIncFiscal: json['iss_inc_fiscal'],
      issProcessNumber: json['iss_process_number'],
      sendXmlNfeOnly: json['send_xml_nfe_only'],
      street: json['street'],
      nmbr: json['nmbr'],
      complement: json['complement'],
      neighborhood: json['neighborhood'],
      region: json['region'],
      addressKind: json['address_kind'],
      zipCode: json['zip_code'],
      tbCountryId: json['tb_country_id'],
      nameCountry: json['name_country'],
      tbStateId: json['tb_state_id'],
      nameState: json['name_state'],
      tbCityId: json['tb_city_id'],
      nameCity: json['name_city'],
      main: json['main'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      phoneKind: json['phone_kind'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_company'] = nameCompany;
    data['nick_trade'] = nickTrade;
    data['tb_line_buiness_id'] = tbLineBuinessId;
    data['note'] = note;
    data['active'] = active;
    data['cnpj'] = cnpj;
    data['ie'] = ie;
    data['im'] = im;
    data['iest'] = iest;
    data['dt_foundation'] = dtFoundation;
    data['crt'] = crt;
    data['crt_modal'] = crtModal;
    data['ind_ie_destinatario'] = indIeDestinatario;
    data['iss_ind_exig'] = issIndExig;
    data['iss_retencao'] = issRetencao;
    data['iss_inc_fiscal'] = issIncFiscal;
    data['iss_process_number'] = issProcessNumber;
    data['send_xml_nfe_only'] = sendXmlNfeOnly;
    data['street'] = street;
    data['nmbr'] = nmbr;
    data['complement'] = complement;
    data['neighborhood'] = neighborhood;
    data['region'] = region;
    data['address_kind'] = addressKind;
    data['zip_code'] = zipCode;
    data['tb_country_id'] = tbCountryId;
    data['tb_state_id'] = tbStateId;
    data['tb_city_id'] = tbCityId;
    data['main'] = main;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['phone_kind'] = phoneKind;
    data['phone_number'] = phoneNumber;
    return data;
  }

  static InstitutionModel fromEntity(InstitutionEntity entity) {
    return InstitutionModel(
      id: entity.id,
      nameCompany: entity.nameCompany,
      nickTrade: entity.nickTrade,
      tbLineBuinessId: entity.tbLineBuinessId,
      note: entity.note,
      active: entity.active,
      cnpj: entity.cnpj,
      ie: entity.ie,
      im: entity.im,
      iest: entity.iest,
      dtFoundation: entity.dtFoundation,
      crt: entity.crt,
      crtModal: entity.crtModal,
      indIeDestinatario: entity.indIeDestinatario,
      issIndExig: entity.issIndExig,
      issRetencao: entity.issRetencao,
      issIncFiscal: entity.issIncFiscal,
      issProcessNumber: entity.issProcessNumber,
      sendXmlNfeOnly: entity.sendXmlNfeOnly,
      street: entity.street,
      nmbr: entity.nmbr,
      complement: entity.complement,
      neighborhood: entity.neighborhood,
      region: entity.region,
      addressKind: entity.addressKind,
      zipCode: entity.zipCode,
      tbCountryId: entity.tbCountryId,
      nameCountry: entity.nameCountry,
      tbStateId: entity.tbStateId,
      nameState: entity.nameState,
      tbCityId: entity.tbCityId,
      nameCity: entity.nameCity,
      main: entity.main,
      longitude: entity.longitude,
      latitude: entity.latitude,
      phoneKind: entity.phoneKind,
      phoneNumber: entity.phoneNumber,
    );
  }
}
