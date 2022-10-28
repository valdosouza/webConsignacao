class CustomerPersonEntity {
  String cpf;
  String rg;
  String rgDtEmission;
  String rgOrganIssuer;
  String rgStateIssuer;
  String birthday;
  String tbProfessionId;

  CustomerPersonEntity({
    this.cpf = "",
    this.rg = "",
    this.rgDtEmission = "",
    this.rgOrganIssuer = "",
    this.rgStateIssuer = "",
    this.birthday = "",
    this.tbProfessionId = "",
  });

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
