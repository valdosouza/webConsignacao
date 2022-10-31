class CustomerPersonEntity {
  String cpf;
  String rg;
  String rgDtEmission;
  String rgOrganIssuer;
  int rgStateIssuer;
  String birthday;
  int tbProfessionId;

  CustomerPersonEntity({
    this.cpf = "",
    this.rg = "",
    this.rgDtEmission = "",
    this.rgOrganIssuer = "",
    this.rgStateIssuer = 0,
    this.birthday = "",
    this.tbProfessionId = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cpf'] = cpf;
    data['rg'] = rg;
    data['rg_dt_emission'] = rgDtEmission;
    data['rg_organ_issuer'] = rgOrganIssuer;
    data['rg_state_issuer'] = 0;
    data['birthday'] = birthday;
    data['tb_profession_id'] = 0;
    return data;
  }
}
