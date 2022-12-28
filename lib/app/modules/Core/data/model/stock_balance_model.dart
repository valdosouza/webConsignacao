import 'package:appweb/app/modules/Core/domain/entity/stock_balance_entity.dart';

class StockBalanceModel extends StockBalanceEntity {
  StockBalanceModel({int? tbProductId, String? nameProduct, int? quantity})
      : super(
            tbProductId: tbProductId ?? 0,
            nameProduct: nameProduct ?? "",
            quantity: quantity ?? 0);

  factory StockBalanceModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceModel(
      tbProductId: json['tbProductId'],
      nameProduct: json['nameProduct'],
      quantity: json['quantity'],
    );
  }
}
