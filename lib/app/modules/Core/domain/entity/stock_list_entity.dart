class StockListEntity {
  int id;
  int tbInstitutionId;
  String description;
  String main;
  String active;

  StockListEntity(
      {required this.id,
      required this.tbInstitutionId,
      required this.description,
      required this.main,
      required this.active});
}
