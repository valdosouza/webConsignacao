class PriceListRegisterEntity {
  int id;
  int tbInstitutionId;
  String description;
  dynamic validity;
  dynamic modality;
  String aliqProfit;
  String active;

  PriceListRegisterEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.validity,
    this.modality,
    this.aliqProfit = "",
    this.active = "",
  });
}
