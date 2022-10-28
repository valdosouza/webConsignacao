import 'package:appweb/app/modules/customer_register/domain/entity/customer_person_entity.dart';

class CustomerPersonModel extends CustomerPersonEntity {
  CustomerPersonModel({
    String? cpf,
    String? rg,
    String? rgDtEmission,
    String? rgOrganIssuer,
    String? rgStateIssuer,
    String? birthday,
    String? tbProfessionId,
  }) : super(
            cpf: cpf = "",
            rg: rg = "",
            rgDtEmission: rgDtEmission = "",
            rgOrganIssuer: rgOrganIssuer = "",
            rgStateIssuer: rgStateIssuer = "",
            birthday: birthday = "",
            tbProfessionId: tbProfessionId ?? "");

  factory CustomerPersonModel.fromJson(Map<String, dynamic> json) {
    return CustomerPersonModel(
      cpf: json['cpf'] as String? ?? "",
      rg: json['rg'] as String? ?? "",
      rgDtEmission: json['rg_dt_emission'] as String? ?? "",
      rgOrganIssuer: json['rg_organ_issuer'] as String? ?? "",
      rgStateIssuer: json['rg_state_issuer'] as String? ?? "",
      birthday: json['birthday'] as String? ?? "",
      tbProfessionId: json['tb_profession_id'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cpf'] = cpf;
    data['rg'] = rg;
    data['rg_dt_emission'] = rgDtEmission;
    data['rg_organ_issuer'] = rgOrganIssuer;
    data['rg_state_issuer'] = rgStateIssuer;
    data['birthday'] = birthday;
    data['tb_profession_id'] = tbProfessionId;
    return data;
  }
}
