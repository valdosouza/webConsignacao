class SalesRouteListEntity {
  int id;
  int tbInstitutionId;
  String description;
  String active;
  String street;
  String nmbr;
  String complement;
  bool expanded;

  SalesRouteListEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.description = "",
    this.active = "",
    this.street = "",
    this.nmbr = "",
    this.complement = "",
    this.expanded = false,
  });
}
