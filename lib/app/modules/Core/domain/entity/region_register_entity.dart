class RegionEntity {
  int id;
  int tbInstitutionId;
  String description;
  int tbSalesmanId;
  String salesmanName;
  String active;

  RegionEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.tbSalesmanId = 0,
    this.salesmanName = "",
    this.active = "",
  });
}
