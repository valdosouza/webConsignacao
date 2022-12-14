class PriceListModel {
  int id;
  int tbInstitutionId;
  String description;
  dynamic validity;
  dynamic modality;
  double aliqProfit;
  String active;

  PriceListModel({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.validity,
    this.modality,
    this.aliqProfit = 0,
    this.active = "",
  });
}
