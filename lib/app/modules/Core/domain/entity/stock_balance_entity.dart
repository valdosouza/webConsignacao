class StockBalanceEntity {
  final int tbMerchandiseId;
  final String nameMerchandise;
  final int quantity;

  StockBalanceEntity(
      {required this.tbMerchandiseId,
      required this.nameMerchandise,
      required this.quantity});
}
