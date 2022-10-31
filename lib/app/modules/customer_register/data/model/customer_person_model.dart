import 'package:appweb/app/modules/customer_register/domain/entity/customer_person_entity.dart';

class CustomerPersonModel extends CustomerPersonEntity {
  CustomerPersonModel({
    String? cpf,
    String? rg,
    String? rgDtEmission,
    String? rgOrganIssuer,
    int? rgStateIssuer,
    String? birthday,
    int? tbProfessionId,
  }) : super(
            cpf: cpf ?? "",
            rg: rg ?? "",
            rgDtEmission: rgDtEmission ?? "",
            rgOrganIssuer: rgOrganIssuer ?? "",
            rgStateIssuer: rgStateIssuer ?? 0,
            birthday: birthday ?? "",
            tbProfessionId: tbProfessionId ?? 0);

  factory CustomerPersonModel.fromJson(Map<String, dynamic> json) {
    return CustomerPersonModel(
      cpf: json['cpf'] as String? ?? "",
      rg: json['rg'] as String? ?? "",
      rgDtEmission: json['rg_dt_emission'] as String? ?? "",
      rgOrganIssuer: json['rg_organ_issuer'] as String? ?? "",
      rgStateIssuer: json['rg_state_issuer'] as int? ?? 0,
      birthday: json['birthday'] as String? ?? "",
      tbProfessionId: json['tb_profession_id'] as int? ?? 0,
    );
  }
}
