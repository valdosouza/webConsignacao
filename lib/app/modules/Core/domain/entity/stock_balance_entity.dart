import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';

class StockBalanceEntity {
  int tbStockListId;
  String nameStockList;
  List<StockBalanceItemsModel> items;
  StockBalanceEntity({
    required this.tbStockListId,
    required this.nameStockList,
    required this.items,
  });
}

class StockBalanceItemsEntity {
  final int tbMerchandiseId;
  final String nameMerchandise;
  final int quantity;

  StockBalanceItemsEntity(
      {required this.tbMerchandiseId,
      required this.nameMerchandise,
      required this.quantity});
}
