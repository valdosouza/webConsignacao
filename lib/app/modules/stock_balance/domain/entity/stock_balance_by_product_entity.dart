import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';

class StockBalanceByProductEntity {
  int tbMerchandiseId;
  String nameProduct;
  List<StockBalanceCustomerModel> items;
  StockBalanceByProductEntity({
    required this.tbMerchandiseId,
    required this.nameProduct,
    required this.items,
  });
}

class StockBalanceCustomerEntity {
  final String nameCustomer;
  final int quantity;

  StockBalanceCustomerEntity(
      {required this.nameCustomer, required this.quantity});
}
