class ProductListEntity {
  int id;
  int tbInstitutionId;
  String description;
  String active;

  ProductListEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.active = "N",
  });
}
