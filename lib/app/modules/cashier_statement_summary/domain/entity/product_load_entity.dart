class ProductLoadEntity {
  int id;
  String description;
  int totalSale;
  int totalBonus;
  int totalAdjust;
  int totalNewLoad;

  ProductLoadEntity(
      {required this.id,
      required this.description,
      required this.totalSale,
      required this.totalBonus,
      required this.totalAdjust,
      required this.totalNewLoad});
}
