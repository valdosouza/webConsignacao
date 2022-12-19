class PersonEntity {
  int id;
  String cpf;
  String rg;
  String rgDtEmission;
  String rgOrganIssuer;
  int rgStateIssuer;
  String birthday;
  int tbProfessionId;

  PersonEntity({
    this.id = 0,
    this.cpf = "",
    this.rg = "",
    this.rgDtEmission = "",
    this.rgOrganIssuer = "",
    this.rgStateIssuer = 0,
    this.birthday = "",
    this.tbProfessionId = 0,
  });
}
