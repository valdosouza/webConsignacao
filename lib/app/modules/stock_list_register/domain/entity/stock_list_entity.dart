class StockListEntity {
  int id;
  int institution;
  String description;
  String main;
  String active;

  StockListEntity(
      {required this.id,
      required this.institution,
      required this.description,
      required this.main,
      required this.active});
}
