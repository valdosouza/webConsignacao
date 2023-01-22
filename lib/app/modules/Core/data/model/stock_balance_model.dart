import 'package:appweb/app/modules/Core/domain/entity/stock_balance_entity.dart';

class StockBalanceModel extends StockBalanceEntity {
  StockBalanceModel({
    int? tbStockListId,
    String? nameStockList,
    List<StockBalanceItemsModel>? items,
  }) : super(
          tbStockListId: tbStockListId ?? 0,
          nameStockList: nameStockList ?? "",
          items: items ?? [],
        );

  factory StockBalanceModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceModel(
      tbStockListId: json['tb_stock_list_id'] as int? ?? 0,
      nameStockList: json['name_stock_list'],
      items: json['items'] == null
          ? null
          : (json['items'] as List)
              .map((e) => StockBalanceItemsModel.fromJson(e))
              .toList(),
    );
  }

  factory StockBalanceModel.empty() {
    return StockBalanceModel(
      tbStockListId: 0,
      nameStockList: "",
      items: [],
    );
  }
}

class StockBalanceItemsModel extends StockBalanceItemsEntity {
  StockBalanceItemsModel({
    int? tbMerchandiseId,
    String? nameMerchandise,
    int? quantity,
  }) : super(
            tbMerchandiseId: tbMerchandiseId ?? 0,
            nameMerchandise: nameMerchandise ?? "",
            quantity: quantity ?? 0);

  factory StockBalanceItemsModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceItemsModel(
      tbMerchandiseId: json['tb_merchandise_id'] as int? ?? 0,
      nameMerchandise: json['name_merchandise'],
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
    );
  }
}
