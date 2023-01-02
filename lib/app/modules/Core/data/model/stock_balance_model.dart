import 'package:appweb/app/modules/Core/domain/entity/stock_balance_entity.dart';

class StockBalanceModel extends StockBalanceEntity {
  StockBalanceModel(
      {int? tbMerchandiseId, String? nameMerchandise, int? quantity})
      : super(
            tbMerchandiseId: tbMerchandiseId ?? 0,
            nameMerchandise: nameMerchandise ?? "",
            quantity: quantity ?? 0);

  factory StockBalanceModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceModel(
      tbMerchandiseId: json['tb_merchandise_id'] as int? ?? 0,
      nameMerchandise: json['name_merchandise'],
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
    );
  }
}
